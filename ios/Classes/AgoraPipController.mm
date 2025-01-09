#include "AgoraPipController.h"

#import <AgoraRtcKit/AgoraMediaBase.h>
#import <AgoraRtcKit/IAgoraMediaEngine.h>
#include <AgoraRtcWrapper/iris_rtc_rendering_cxx.h>

#import <AVKit/AVKit.h>
#import <UIKit/UIKit.h>

struct AgoraPipFrameMeta {
  int rotation_ = 0;
  AgoraVideoMirrorMode mirrorMode_ =
      AgoraVideoMirrorMode::AgoraVideoMirrorModeAuto;
  AgoraVideoRenderMode renderMode_ =
      AgoraVideoRenderMode::AgoraVideoRenderModeFit;

  bool operator==(const AgoraPipFrameMeta &other) const {
    return mirrorMode_ == other.mirrorMode_ && rotation_ == other.rotation_;
  }

  bool operator!=(const AgoraPipFrameMeta &other) const {
    return !(*this == other);
  }

  CGAffineTransform getTransform() const {
    CGAffineTransform matrix = CGAffineTransformIdentity;
    switch (rotation_) {
    case 90:
      matrix = CGAffineTransformRotate(matrix, M_PI_2);
      break;
    case 180:
      matrix = CGAffineTransformRotate(matrix, M_PI);
      break;
    case 270:
      matrix = CGAffineTransformRotate(matrix, -M_PI_2);
      break;
    default:
      break;
    }
    if (mirrorMode_ == AgoraVideoMirrorMode::AgoraVideoMirrorModeEnabled) {
      matrix = CGAffineTransformScale(matrix, -1, 1);
    }
    return matrix;
  }
};

@interface AgoraPipView : UIView

@property(nonatomic, assign) AgoraPipFrameMeta frameMeta;

@end

@implementation AgoraPipView

+ (Class)layerClass {
  return [AVSampleBufferDisplayLayer class];
}

- (AVSampleBufferDisplayLayer *)sampleBufferDisplayLayer {
  return (AVSampleBufferDisplayLayer *)self.layer;
}

- (void)setMirrorMode:(enum AgoraVideoMirrorMode)mirrorMode {
  if (_frameMeta.mirrorMode_ == mirrorMode) {
    return;
  }

  _frameMeta.mirrorMode_ = mirrorMode;

  [[self sampleBufferDisplayLayer]
      setAffineTransform:_frameMeta.getTransform()];
}

- (void)setRenderMode:(enum AgoraVideoRenderMode)renderMode {
  if (_frameMeta.renderMode_ == renderMode) {
    return;
  }

  _frameMeta.renderMode_ = renderMode;

  if (_frameMeta.renderMode_ == AgoraVideoRenderMode::AgoraVideoRenderModeFit) {
    [[self sampleBufferDisplayLayer]
        setVideoGravity:AVLayerVideoGravityResizeAspect];
  } else {
    [[self sampleBufferDisplayLayer]
        setVideoGravity:AVLayerVideoGravityResizeAspectFill];
  }
}

- (void)renderCVPixelBuffer:(CVPixelBufferRef)pixelBuffer {
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

  // when switch to background too fast, the sampleBufferDisplayLayer status
  // will be failed, we need to flush it.
  if ([[self sampleBufferDisplayLayer] status] ==
      AVQueuedSampleBufferRenderingStatusFailed) {
    NSLog(@"pip: sampleBufferDisplayLayer status failed, current error: %@",
          [[self sampleBufferDisplayLayer] error]);
    [[self sampleBufferDisplayLayer] flush];
  }

  [[self sampleBufferDisplayLayer] enqueueSampleBuffer:sampleBuffer];
  if (sampleBuffer) {
    CFRelease(sampleBuffer);
  }
}

- (void)renderFrame:(const agora::media::base::VideoFrame *_Nonnull)frame {
  CVPixelBufferRef _Nullable pixelBuffer =
      reinterpret_cast<CVPixelBufferRef>(frame->pixelBuffer);
  if (!pixelBuffer) {
    return;
  }

  AgoraPipFrameMeta frameMeta{.rotation_ = frame->rotation,
                              .mirrorMode_ = _frameMeta.mirrorMode_,
                              .renderMode_ = _frameMeta.renderMode_};
  if (frameMeta != _frameMeta) {
    _frameMeta = frameMeta;
    [[self sampleBufferDisplayLayer]
        setAffineTransform:_frameMeta.getTransform()];
  }

  // notify new frame available on main thread
  [self renderCVPixelBuffer:pixelBuffer];
}

@end

@implementation AgoraPipOptions {
}
@end

class AgoraVideoFrameDelegate : public agora::iris::VideoFrameObserverDelegate {
public:
  AgoraVideoFrameDelegate(AgoraPipView *view,
                          agora::iris::IrisRtcRendering *irisRendering,
                          const IrisRtcVideoFrameConfig &config)
      : view_(view), irisRendering_(irisRendering) {
    memcpy(&config_, &config, sizeof(IrisRtcVideoFrameConfig));
    videoFrameDelegateId_ =
        irisRendering->AddVideoFrameObserverDelegate(config_, this);
  }

  ~AgoraVideoFrameDelegate() {
    if (videoFrameDelegateId_ >= 0) {
      irisRendering_->RemoveVideoFrameObserverDelegate(videoFrameDelegateId_);
    }
  }

  bool IsVideoFrameConfigEqual(const IrisRtcVideoFrameConfig &config) {
    return config_.video_source_type == config.video_source_type &&
           config_.video_frame_format == config.video_frame_format &&
           config_.video_view_setup_mode == config.video_view_setup_mode &&
           config_.observed_frame_position == config.observed_frame_position &&
           config_.uid == config.uid &&
           strcmp(config_.channelId, config.channelId) == 0;
  }

  void OnVideoFrameReceived(const void *videoFrame,
                            const IrisRtcVideoFrameConfig &config,
                            bool resize) override {
    @autoreleasepool {
      auto *frame =
          static_cast<const agora::media::base::VideoFrame *>(videoFrame);

      if (frame->width == 0 || frame->height == 0) {
        return;
      }

      dispatch_sync(dispatch_get_main_queue(), ^{
        [view_ renderFrame:frame];
      });
    }
  }

private:
  AgoraPipView *view_;
  agora::iris::IrisRtcRendering *irisRendering_;

  int videoFrameDelegateId_;
  IrisRtcVideoFrameConfig config_;
};

@interface AgoraPipController ()

// delegate
@property(nonatomic, weak) id<AgoraPipStateChangedDelegate> pipStateDelegate;

// is actived
@property(atomic, assign) BOOL isPipActived;

// pip view
@property(nonatomic, strong) AgoraPipView *pipView;

// pip controller
@property(nonatomic, strong) AVPictureInPictureController *pipController;

// video frame delegate
@property(nonatomic, assign) AgoraVideoFrameDelegate *videoFrameDelegate;

@end

@implementation AgoraPipController

- (instancetype)initWith:(id<AgoraPipStateChangedDelegate>)delegate {
  self = [super init];
  if (self) {
    _pipStateDelegate = delegate;
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
  return _isPipActived;
}

- (BOOL)setup:(AgoraPipOptions *)options {
  if (![self isSupported]) {
    [_pipStateDelegate pipStateChanged:AgoraPipStateFailed
                                 error:@"Pip is not supported"];
    return NO;
  }

  if (__builtin_available(iOS 15.0, *)) {
    if (_pipController == nil) {
      // create pip view
      _pipView = [[AgoraPipView alloc] init];
      _pipView.autoresizingMask =
          UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;

      // create pip view controller
      AVPictureInPictureVideoCallViewController *pipViewController =
          [[AVPictureInPictureVideoCallViewController alloc] init];
      // if the preferredContentSize is not set, use 100x100 as the default size
      // coz invalid size will cause the pip view to start failed with
      // Domain=PGPegasusErrorDomain Code=-1003.
      pipViewController.preferredContentSize =
          CGSizeMake(options.preferredContentSize.width <= 0
                         ? 100
                         : options.preferredContentSize.width,
                     options.preferredContentSize.height <= 0
                         ? 100
                         : options.preferredContentSize.height);
      pipViewController.view.backgroundColor = UIColor.clearColor;
      [pipViewController.view addSubview:_pipView];

      // create pip controller
      // we allow the videoCanvas to be nil, which means to use the root view
      // of the app as the source view and do not render the video for now.
      UIView *sourceView =
          (options.videoCanvas != nil && options.videoCanvas.view != nil)
              ? options.videoCanvas.view
              : [UIApplication.sharedApplication.keyWindow rootViewController]
                    .view;
      AVPictureInPictureControllerContentSource *contentSource =
          [[AVPictureInPictureControllerContentSource alloc]
              initWithActiveVideoCallSourceView:sourceView
                          contentViewController:pipViewController];

      _pipController = [[AVPictureInPictureController alloc]
          initWithContentSource:contentSource];
      _pipController.delegate = self;
      _pipController.canStartPictureInPictureAutomaticallyFromInline =
          options.autoEnterEnabled;
    }

    if (options.videoCanvas != nil) {
      [_pipView setMirrorMode:options.videoCanvas.mirrorMode];
      [_pipView setRenderMode:options.videoCanvas.renderMode];
    }

    [self initOrUpdateVideoFrameDelegate:_pipView
                           irisRendering:(agora::iris::IrisRtcRendering *)
                                             options.renderingHandle
                              connection:options.connection
                             videoCanvas:options.videoCanvas];

    return YES;
  }

  return NO;
}

- (BOOL)start {
  if (![self isSupported]) {
    [_pipStateDelegate pipStateChanged:AgoraPipStateFailed
                                 error:@"Pip is not supported"];
    return NO;
  }

  dispatch_async(dispatch_get_main_queue(), ^{
    if (self->_pipController == nil) {
      [self->_pipStateDelegate
          pipStateChanged:AgoraPipStateFailed
                    error:@"Pip controller is not initialized"];
      return;
    }

    if (![self->_pipController isPictureInPicturePossible]) {
      [self->_pipStateDelegate pipStateChanged:AgoraPipStateFailed
                                         error:@"Pip is not possible"];
    } else if (![self->_pipController isPictureInPictureActive]) {
      [self->_pipController startPictureInPicture];
    }
  });

  return YES;
}

- (void)stop {
  if (![self isSupported]) {
    [_pipStateDelegate pipStateChanged:AgoraPipStateFailed
                                 error:@"Pip is not supported"];
    return;
  }

  dispatch_async(dispatch_get_main_queue(), ^{
    if (self->_pipController == nil ||
        ![self->_pipController isPictureInPictureActive]) {
      // no need to call pipStateChanged since the pip controller is not
      // initialized.
      return;
    }

    [self->_pipController stopPictureInPicture];
  });
}

- (void)dispose {
  dispatch_async(dispatch_get_main_queue(), ^{
    if (self->_pipController == nil) {
      return;
    }

    [self destroyVideoFrameDelegate];

    if ([self->_pipController isPictureInPictureActive]) {
      [self->_pipController stopPictureInPicture];
    }

    self->_pipController = nil;
    self->_pipView = nil;

    self->_isPipActived = NO;
    [self->_pipStateDelegate pipStateChanged:AgoraPipStateStopped error:nil];
  });
}

- (void)pictureInPictureControllerWillStartPictureInPicture:
    (AVPictureInPictureController *)pictureInPictureController {
  NSLog(@"pip: pictureInPictureControllerWillStartPictureInPicture");
}

- (void)pictureInPictureControllerDidStartPictureInPicture:
    (AVPictureInPictureController *)pictureInPictureController {
  NSLog(@"pip: pictureInPictureControllerDidStartPictureInPicture");

  _isPipActived = YES;
  [_pipStateDelegate pipStateChanged:AgoraPipStateStarted error:nil];
}

- (void)pictureInPictureController:
            (AVPictureInPictureController *)pictureInPictureController
    failedToStartPictureInPictureWithError:(NSError *)error {
  NSLog(@"pip: pictureInPictureController "
        @"failedToStartPictureInPictureWithError: %@",
        error);
  [_pipStateDelegate pipStateChanged:AgoraPipStateFailed
                               error:error.description];
}

- (void)pictureInPictureControllerWillStopPictureInPicture:
    (AVPictureInPictureController *)pictureInPictureController {
  NSLog(@"pip: pictureInPictureControllerWillStopPictureInPicture");
}

- (void)pictureInPictureControllerDidStopPictureInPicture:
    (AVPictureInPictureController *)pictureInPictureController {
  NSLog(@"pip: pictureInPictureControllerDidStopPictureInPicture");

  _isPipActived = NO;
  [_pipStateDelegate pipStateChanged:AgoraPipStateStopped error:nil];
}

- (void)initOrUpdateVideoFrameDelegate:(AgoraPipView *_Nonnull)pipView
                         irisRendering:(agora::iris::IrisRtcRendering *_Nonnull)
                                           irisRendering
                            connection:(AgoraRtcConnection *_Nullable)connection
                           videoCanvas:
                               (AgoraRtcVideoCanvas *_Nullable)videoCanvas {
  if (videoCanvas == nil) {
    // if the videoCanvas is nil and the videoFrameDelegate is not nil, we need
    // to destroy the videoFrameDelegate.
    if (_videoFrameDelegate != nil) {
      [self destroyVideoFrameDelegate];
    }

    return;
  }

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
  if (connection.channelId && (NSNull *)connection.channelId != [NSNull null]) {
    strcpy(config.channelId, [connection.channelId UTF8String]);
  } else {
    strcpy(config.channelId, "");
  }

  if (_videoFrameDelegate != nil &&
      !_videoFrameDelegate->IsVideoFrameConfigEqual(config)) {
    [self destroyVideoFrameDelegate];
  }

  if (_videoFrameDelegate == nil) {
    _videoFrameDelegate =
        new AgoraVideoFrameDelegate(pipView, irisRendering, config);
  }
}

- (void)destroyVideoFrameDelegate {
  if (_videoFrameDelegate != nil) {
    delete _videoFrameDelegate;
    _videoFrameDelegate = nil;
  }
}

@end
