#include "AgoraPipController.h"

#import <AgoraRtcKit/AgoraMediaBase.h>
#import <AgoraRtcKit/IAgoraMediaEngine.h>
#include <AgoraRtcWrapper/iris_rtc_rendering_cxx.h>

#import <AVKit/AVKit.h>
#import <UIKit/UIKit.h>

@interface AgoraPipView : UIView
@end

@implementation AgoraPipView

+ (Class)layerClass {
  return [AVSampleBufferDisplayLayer class];
}

- (AVSampleBufferDisplayLayer *)sampleBufferDisplayLayer {
  return (AVSampleBufferDisplayLayer *)self.layer;
}

- (void)renderFrame:(CVPixelBufferRef)pixelBuffer {
  CMVideoFormatDescriptionRef videoInfo = nullptr;
  CMVideoFormatDescriptionCreateForImageBuffer(kCFAllocatorDefault, pixelBuffer,
                                               &videoInfo);

  CMSampleTimingInfo timingInfo;
  timingInfo.duration = kCMTimeZero;
  timingInfo.decodeTimeStamp = kCMTimeInvalid;
  timingInfo.presentationTimeStamp =
      CMTimeMake(int64_t(CACurrentMediaTime() * 1000), 1000);

  CMSampleBufferRef sampleBuffer = nullptr;
  CMSampleBufferCreateReadyWithImageBuffer(
      kCFAllocatorDefault, pixelBuffer, videoInfo, &timingInfo, &sampleBuffer);

  [[self sampleBufferDisplayLayer] enqueueSampleBuffer:sampleBuffer];
  if (sampleBuffer) {
    CFRelease(sampleBuffer);
  }
}

@end

@implementation AgoraPipOptions {
}
@end

class AgoraVideoFrameDelegate : public agora::iris::VideoFrameObserverDelegate {
public:
  AgoraVideoFrameDelegate(AgoraPipView *view) : view_(view) {}

  ~AgoraVideoFrameDelegate() {}

  void OnVideoFrameReceived(const void *videoFrame,
                            const IrisRtcVideoFrameConfig &config,
                            bool resize) override {
    @autoreleasepool {
      auto *frame =
          static_cast<const agora::media::base::VideoFrame *>(videoFrame);

      if (frame->width == 0 || frame->height == 0) {
        return;
      }

      CVPixelBufferRef _Nullable pixelBuffer =
          reinterpret_cast<CVPixelBufferRef>(frame->pixelBuffer);
      if (!pixelBuffer) {
        return;
      }

      // notify new frame available on main thread
      dispatch_sync(dispatch_get_main_queue(), ^{
        [view_ renderFrame:pixelBuffer];
      });
    }
  }

private:
  AgoraPipView *view_;
};

@interface AgoraPipController ()

// delegate
@property(nonatomic, weak) id<AgoraPipStateChangedDelegate> pipStateDelegate;

// options
@property(nonatomic, strong) AgoraPipOptions *options;

// is actived
@property(atomic, assign) BOOL isPipActived;

// pip view
@property(nonatomic, strong) AgoraPipView *pipView;

// pip controller
@property(nonatomic, strong) AVPictureInPictureController *pipController;

// video frame delegate id
@property(nonatomic, assign) int videoFrameDelegateId;

// video frame delegate
@property(nonatomic, assign) AgoraVideoFrameDelegate *videoFrameDelegate;

@end

@implementation AgoraPipController

- (instancetype)initWith:(id<AgoraPipStateChangedDelegate>)delegate {
  self = [super init];
  if (self) {
    self.pipStateDelegate = delegate;
  }
  return self;
}

- (BOOL)isSupported {
  // In iOS 15 and later, AVKit provides PiP support for video-calling apps,
  // which enables you to deliver a familiar video-calling experience that
  // behaves like FaceTime.
  // https://developer.apple.com/documentation/avkit/avpictureinpicturecontroller/ispictureinpicturesupported()?language=objc
  // https://developer.apple.com/documentation/avkit/adopting-picture-in-picture-for-video-calls?language=objc
  //
  if (__builtin_available(iOS 15.0, *)) {
    return [AVPictureInPictureController isPictureInPictureSupported];
  }

  return NO;
}

- (BOOL)isAutoEnterSupported {
  // canStartPictureInPictureAutomaticallyFromInline is only available on iOS
  // after 14.2, so we just need to check if pip is supported.
  // https://developer.apple.com/documentation/avkit/avpictureinpicturecontroller/canstartpictureinpictureautomaticallyfrominline?language=objc
  //
  return [self isSupported];
}

- (BOOL)isActived {
  return self.isPipActived;
}

- (BOOL)setup:(AgoraPipOptions *)options {
  if (![self isSupported]) {
    [self.pipStateDelegate pipStateChanged:AgoraPipStateFailed
                                     error:@"Pip is not supported"];
    return NO;
  }

  if (__builtin_available(iOS 15.0, *)) {
    if (self.options == nil) {
      self.options = [[AgoraPipOptions alloc] init];

      // only allow to update autoEnterEnabled and preferredContentSize when
      // self.options is nil
      self.options.autoEnterEnabled = options.autoEnterEnabled;
      self.options.preferredContentSize = options.preferredContentSize;
      self.options.renderingHandle = options.renderingHandle;
    }

    [self initOrUpdatePipViewRenderer:(agora::iris::IrisRtcRendering *)
                                          options.renderingHandle
                           connection:options.connection
                          videoCanvas:options.videoCanvas];

    if (self.pipController == nil) {
      // create pip view
      self.pipView = [[AgoraPipView alloc] init];
      self.pipView.autoresizingMask =
          UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;

      // create pip view controller
      AVPictureInPictureVideoCallViewController *pipViewController =
          [[AVPictureInPictureVideoCallViewController alloc] init];
      pipViewController.preferredContentSize =
          CGSizeMake(self.options.preferredContentSize.width,
                     self.options.preferredContentSize.height);
      pipViewController.view.backgroundColor = UIColor.clearColor;
      [pipViewController.view addSubview:self.pipView];

      // create pip controller
      // we allow the videoCanvas to be nil, which means to use the root view
      // of the app as the source view and do not render the video for now.
      UIView *sourceView =
          (self.options.videoCanvas != nil &&
           self.options.videoCanvas.view != nil)
              ? self.options.videoCanvas.view
              : [UIApplication.sharedApplication.keyWindow rootViewController]
                    .view;
      AVPictureInPictureControllerContentSource *contentSource =
          [[AVPictureInPictureControllerContentSource alloc]
              initWithActiveVideoCallSourceView:sourceView
                          contentViewController:pipViewController];

      self.pipController = [[AVPictureInPictureController alloc]
          initWithContentSource:contentSource];
      self.pipController.delegate = self;
      self.pipController.canStartPictureInPictureAutomaticallyFromInline = YES;
    }

    return YES;
  }

  return NO;
}

- (BOOL)start {
  if (![self isSupported]) {
    [self.pipStateDelegate pipStateChanged:AgoraPipStateFailed
                                     error:@"Pip is not supported"];
    return NO;
  }

  dispatch_async(dispatch_get_main_queue(), ^{
    if (self.pipController == nil) {
      [self.pipStateDelegate
          pipStateChanged:AgoraPipStateFailed
                    error:@"Pip controller is not initialized"];
      return;
    }

    if (![self.pipController isPictureInPicturePossible]) {
      [self.pipStateDelegate pipStateChanged:AgoraPipStateFailed
                                       error:@"Pip is not possible"];

    } else if (![self.pipController isPictureInPictureActive]) {
      [self.pipController startPictureInPicture];
    }
  });

  return YES;
}

- (void)stop {
  if (![self isSupported]) {
    [self.pipStateDelegate pipStateChanged:AgoraPipStateFailed
                                     error:@"Pip is not supported"];
    return;
  }

  dispatch_async(dispatch_get_main_queue(), ^{
    if (self.pipController == nil ||
        ![self.pipController isPictureInPictureActive]) {
      // no need to call pipStateChanged since the pip controller is not
      // initialized.
      return;
    }

    [self.pipController stopPictureInPicture];
  });
}

- (void)dispose {
  dispatch_async(dispatch_get_main_queue(), ^{
    if (self.pipController == nil) {
      return;
    }

    [self destroyVideoFrameDelegate];

    if ([self.pipController isPictureInPictureActive]) {
      [self.pipController stopPictureInPicture];
    }

    self.pipController = nil;
    self.pipView = nil;

    self.options = nil;

    self.isPipActived = NO;
    [self.pipStateDelegate pipStateChanged:AgoraPipStateStopped error:nil];
  });
}

- (void)pictureInPictureControllerWillStartPictureInPicture:
    (AVPictureInPictureController *)pictureInPictureController {
  NSLog(@"pip: pictureInPictureControllerWillStartPictureInPicture");
}

- (void)pictureInPictureControllerDidStartPictureInPicture:
    (AVPictureInPictureController *)pictureInPictureController {
  NSLog(@"pip: pictureInPictureControllerDidStartPictureInPicture");

  self.isPipActived = YES;
  [self.pipStateDelegate pipStateChanged:AgoraPipStateStarted error:nil];
}

- (void)pictureInPictureController:
            (AVPictureInPictureController *)pictureInPictureController
    failedToStartPictureInPictureWithError:(NSError *)error {
  NSLog(@"pip: pictureInPictureController "
        @"failedToStartPictureInPictureWithError: %@",
        error);
  [self.pipStateDelegate pipStateChanged:AgoraPipStateFailed
                                   error:error.description];
}

- (void)pictureInPictureControllerWillStopPictureInPicture:
    (AVPictureInPictureController *)pictureInPictureController {
  NSLog(@"pip: pictureInPictureControllerWillStopPictureInPicture");
}

- (void)pictureInPictureControllerDidStopPictureInPicture:
    (AVPictureInPictureController *)pictureInPictureController {
  NSLog(@"pip: pictureInPictureControllerDidStopPictureInPicture");

  self.isPipActived = NO;
  [self.pipStateDelegate pipStateChanged:AgoraPipStateStopped error:nil];
}

- (void)initOrUpdatePipViewRenderer:
            (agora::iris::IrisRtcRendering *_Nonnull)irisRendering
                         connection:(AgoraRtcConnection *_Nullable)connection
                        videoCanvas:
                            (AgoraRtcVideoCanvas *_Nullable)videoCanvas {
  // just return if the videoCanvas is nil and the videoFrameDelegate is nil
  if (videoCanvas == nil && self.videoFrameDelegate == nil) {
    return;
  }

  // need to delete the old videoFrameDelegate if the new videoCanvas is nil or
  // the new config is not equal to the old one.
  if ((self.options.videoCanvas != nil && self.videoFrameDelegate != nil) &&
      (videoCanvas == nil || videoCanvas.uid != self.options.videoCanvas.uid ||
       videoCanvas.renderMode != self.options.videoCanvas.renderMode ||
       videoCanvas.sourceType != self.options.videoCanvas.sourceType)) {
    [self destroyVideoFrameDelegate];
  }

  // create new videoFrameDelegate if the new videoCanvas is not nil
  if (videoCanvas != nil) {
    IrisRtcVideoFrameConfig config;
    config.video_frame_format =
        agora::media::base::VIDEO_PIXEL_FORMAT::VIDEO_CVPIXEL_NV12;
    config.uid = (decltype(config.uid))videoCanvas.uid;
    config.video_source_type =
        (decltype(config.video_source_type))videoCanvas.sourceType;
    config.video_view_setup_mode = 1; /* AgoraVideoViewSetupAdd = 1 */
    config.observed_frame_position =
        agora::media::base::VIDEO_MODULE_POSITION::POSITION_POST_CAPTURER |
        agora::media::base::VIDEO_MODULE_POSITION::POSITION_PRE_RENDERER;
    if (connection.channelId &&
        (NSNull *)connection.channelId != [NSNull null]) {
      strcpy(config.channelId, [connection.channelId UTF8String]);
    } else {
      strcpy(config.channelId, "");
    }

    self.videoFrameDelegate = new AgoraVideoFrameDelegate(self.pipView);
    self.videoFrameDelegateId = irisRendering->AddVideoFrameObserverDelegate(
        config, self.videoFrameDelegate);
  }
}

- (void)destroyVideoFrameDelegate {
  if (self.videoFrameDelegate != nil) {
    auto irisRendering =
        (agora::iris::IrisRtcRendering *)self.options.renderingHandle;
    irisRendering->RemoveVideoFrameObserverDelegate(self.videoFrameDelegateId);
    delete self.videoFrameDelegate;
    self.videoFrameDelegate = nil;
  }
}

@end
