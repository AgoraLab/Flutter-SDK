// ignore_for_file: camel_case_types, non_constant_identifier_names, constant_identifier_names

// AUTO GENERATED FILE, DO NOT EDIT.
//
// Generated by `package:ffigen`.
import 'dart:ffi' as ffi;

/// Bindings to IrisApiEngine
class NativeIrisApiEngineBinding {
  /// Holds the symbol lookup function.
  final ffi.Pointer<T> Function<T extends ffi.NativeType>(String symbolName)
      _lookup;

  /// The symbols are looked up in [dynamicLibrary].
  NativeIrisApiEngineBinding(ffi.DynamicLibrary dynamicLibrary)
      : _lookup = dynamicLibrary.lookup;

  /// The symbols are looked up with [lookup].
  NativeIrisApiEngineBinding.fromLookup(
      ffi.Pointer<T> Function<T extends ffi.NativeType>(String symbolName)
          lookup)
      : _lookup = lookup;

  void enableUseJsonArray(
    int enable,
  ) {
    return _enableUseJsonArray(
      enable,
    );
  }

  late final _enableUseJsonArrayPtr =
      _lookup<ffi.NativeFunction<ffi.Void Function(ffi.Int32)>>(
          'enableUseJsonArray');
  late final _enableUseJsonArray =
      _enableUseJsonArrayPtr.asFunction<void Function(int)>();

  void InitIrisLogger(
    ffi.Pointer<ffi.Int8> path,
    int maxSize,
    int level,
  ) {
    return _InitIrisLogger(
      path,
      maxSize,
      level,
    );
  }

  late final _InitIrisLoggerPtr = _lookup<
      ffi.NativeFunction<
          ffi.Void Function(
              ffi.Pointer<ffi.Int8>, ffi.Int32, ffi.Int32)>>('InitIrisLogger');
  late final _InitIrisLogger = _InitIrisLoggerPtr.asFunction<
      void Function(ffi.Pointer<ffi.Int8>, int, int)>();

  IrisRtcRenderingHandle CreateIrisRtcRendering(
    ffi.Pointer<ffi.Void> iris_api_engine_handle,
  ) {
    return _CreateIrisRtcRendering(
      iris_api_engine_handle,
    );
  }

  late final _CreateIrisRtcRenderingPtr = _lookup<
      ffi.NativeFunction<
          IrisRtcRenderingHandle Function(
              ffi.Pointer<ffi.Void>)>>('CreateIrisRtcRendering');
  late final _CreateIrisRtcRendering = _CreateIrisRtcRenderingPtr.asFunction<
      IrisRtcRenderingHandle Function(ffi.Pointer<ffi.Void>)>();

  void FreeIrisRtcRendering(
    IrisRtcRenderingHandle handle,
  ) {
    return _FreeIrisRtcRendering(
      handle,
    );
  }

  late final _FreeIrisRtcRenderingPtr =
      _lookup<ffi.NativeFunction<ffi.Void Function(IrisRtcRenderingHandle)>>(
          'FreeIrisRtcRendering');
  late final _FreeIrisRtcRendering = _FreeIrisRtcRenderingPtr.asFunction<
      void Function(IrisRtcRenderingHandle)>();

  /// See `IrisRtcRendering::AddVideoFrameCacheKey`
  void AddVideoFrameCacheKey(
    IrisRtcRenderingHandle handle,
    IrisRtcVideoFrameConfig arg1,
  ) {
    return _AddVideoFrameCacheKey(
      handle,
      arg1,
    );
  }

  late final _AddVideoFrameCacheKeyPtr = _lookup<
      ffi.NativeFunction<
          ffi.Void Function(IrisRtcRenderingHandle,
              IrisRtcVideoFrameConfig)>>('AddVideoFrameCacheKey');
  late final _AddVideoFrameCacheKey = _AddVideoFrameCacheKeyPtr.asFunction<
      void Function(IrisRtcRenderingHandle, IrisRtcVideoFrameConfig)>();

  void RemoveVideoFrameCacheKey(
    IrisRtcRenderingHandle handle,
    IrisRtcVideoFrameConfig arg1,
  ) {
    return _RemoveVideoFrameCacheKey(
      handle,
      arg1,
    );
  }

  late final _RemoveVideoFrameCacheKeyPtr = _lookup<
      ffi.NativeFunction<
          ffi.Void Function(IrisRtcRenderingHandle,
              IrisRtcVideoFrameConfig)>>('RemoveVideoFrameCacheKey');
  late final _RemoveVideoFrameCacheKey =
      _RemoveVideoFrameCacheKeyPtr.asFunction<
          void Function(IrisRtcRenderingHandle, IrisRtcVideoFrameConfig)>();

  /// See `IrisRtcRendering::GetVideoFrameCache`
  int GetVideoFrameCache(
    IrisRtcRenderingHandle handle,
    IrisRtcVideoFrameConfig arg1,
  ) {
    return _GetVideoFrameCache(
      handle,
      arg1,
    );
  }

  late final _GetVideoFrameCachePtr = _lookup<
      ffi.NativeFunction<
          ffi.Int32 Function(IrisRtcRenderingHandle,
              IrisRtcVideoFrameConfig)>>('GetVideoFrameCache');
  late final _GetVideoFrameCache = _GetVideoFrameCachePtr.asFunction<
      int Function(IrisRtcRenderingHandle, IrisRtcVideoFrameConfig)>();

  IrisVideoFrameBufferManagerPtr CreateIrisVideoFrameBufferManager() {
    return _CreateIrisVideoFrameBufferManager();
  }

  late final _CreateIrisVideoFrameBufferManagerPtr =
      _lookup<ffi.NativeFunction<IrisVideoFrameBufferManagerPtr Function()>>(
          'CreateIrisVideoFrameBufferManager');
  late final _CreateIrisVideoFrameBufferManager =
      _CreateIrisVideoFrameBufferManagerPtr.asFunction<
          IrisVideoFrameBufferManagerPtr Function()>();

  void FreeIrisVideoFrameBufferManager(
    IrisVideoFrameBufferManagerPtr manager_ptr,
  ) {
    return _FreeIrisVideoFrameBufferManager(
      manager_ptr,
    );
  }

  late final _FreeIrisVideoFrameBufferManagerPtr = _lookup<
          ffi.NativeFunction<
              ffi.Void Function(IrisVideoFrameBufferManagerPtr)>>(
      'FreeIrisVideoFrameBufferManager');
  late final _FreeIrisVideoFrameBufferManager =
      _FreeIrisVideoFrameBufferManagerPtr.asFunction<
          void Function(IrisVideoFrameBufferManagerPtr)>();

  IrisVideoFrameBufferDelegateHandle EnableVideoFrameBuffer(
    IrisVideoFrameBufferManagerPtr manager_ptr,
    ffi.Pointer<IrisCVideoFrameBuffer> buffer,
    int uid,
    ffi.Pointer<ffi.Int8> channel_id,
  ) {
    return _EnableVideoFrameBuffer(
      manager_ptr,
      buffer,
      uid,
      channel_id,
    );
  }

  late final _EnableVideoFrameBufferPtr = _lookup<
      ffi.NativeFunction<
          IrisVideoFrameBufferDelegateHandle Function(
              IrisVideoFrameBufferManagerPtr,
              ffi.Pointer<IrisCVideoFrameBuffer>,
              ffi.Uint32,
              ffi.Pointer<ffi.Int8>)>>('EnableVideoFrameBuffer');
  late final _EnableVideoFrameBuffer = _EnableVideoFrameBufferPtr.asFunction<
      IrisVideoFrameBufferDelegateHandle Function(
          IrisVideoFrameBufferManagerPtr,
          ffi.Pointer<IrisCVideoFrameBuffer>,
          int,
          ffi.Pointer<ffi.Int8>)>();

  IrisVideoFrameBufferDelegateHandle EnableVideoFrameBufferByConfig(
    IrisVideoFrameBufferManagerPtr manager_ptr,
    ffi.Pointer<IrisCVideoFrameBuffer> buffer,
    ffi.Pointer<IrisVideoFrameBufferConfig> config,
  ) {
    return _EnableVideoFrameBufferByConfig(
      manager_ptr,
      buffer,
      config,
    );
  }

  late final _EnableVideoFrameBufferByConfigPtr = _lookup<
          ffi.NativeFunction<
              IrisVideoFrameBufferDelegateHandle Function(
                  IrisVideoFrameBufferManagerPtr,
                  ffi.Pointer<IrisCVideoFrameBuffer>,
                  ffi.Pointer<IrisVideoFrameBufferConfig>)>>(
      'EnableVideoFrameBufferByConfig');
  late final _EnableVideoFrameBufferByConfig =
      _EnableVideoFrameBufferByConfigPtr.asFunction<
          IrisVideoFrameBufferDelegateHandle Function(
              IrisVideoFrameBufferManagerPtr,
              ffi.Pointer<IrisCVideoFrameBuffer>,
              ffi.Pointer<IrisVideoFrameBufferConfig>)>();

  void DisableVideoFrameBufferByDelegate(
    IrisVideoFrameBufferManagerPtr manager_ptr,
    IrisVideoFrameBufferDelegateHandle handle,
  ) {
    return _DisableVideoFrameBufferByDelegate(
      manager_ptr,
      handle,
    );
  }

  late final _DisableVideoFrameBufferByDelegatePtr = _lookup<
          ffi.NativeFunction<
              ffi.Void Function(IrisVideoFrameBufferManagerPtr,
                  IrisVideoFrameBufferDelegateHandle)>>(
      'DisableVideoFrameBufferByDelegate');
  late final _DisableVideoFrameBufferByDelegate =
      _DisableVideoFrameBufferByDelegatePtr.asFunction<
          void Function(IrisVideoFrameBufferManagerPtr,
              IrisVideoFrameBufferDelegateHandle)>();

  void DisableVideoFrameBufferByUid(
    IrisVideoFrameBufferManagerPtr manager_ptr,
    int uid,
    ffi.Pointer<ffi.Int8> channel_id,
    IrisVideoFrameBufferDelegateHandle handle,
  ) {
    return _DisableVideoFrameBufferByUid(
      manager_ptr,
      uid,
      channel_id,
      handle,
    );
  }

  late final _DisableVideoFrameBufferByUidPtr = _lookup<
          ffi.NativeFunction<
              ffi.Void Function(IrisVideoFrameBufferManagerPtr, ffi.Uint32,
                  ffi.Pointer<ffi.Int8>, IrisVideoFrameBufferDelegateHandle)>>(
      'DisableVideoFrameBufferByUid');
  late final _DisableVideoFrameBufferByUid =
      _DisableVideoFrameBufferByUidPtr.asFunction<
          void Function(IrisVideoFrameBufferManagerPtr, int,
              ffi.Pointer<ffi.Int8>, IrisVideoFrameBufferDelegateHandle)>();

  void DisableVideoFrameBufferByConfig(
    IrisVideoFrameBufferManagerPtr manager_ptr,
    ffi.Pointer<IrisVideoFrameBufferConfig> config,
    IrisVideoFrameBufferDelegateHandle handle,
  ) {
    return _DisableVideoFrameBufferByConfig(
      manager_ptr,
      config,
      handle,
    );
  }

  late final _DisableVideoFrameBufferByConfigPtr = _lookup<
          ffi.NativeFunction<
              ffi.Void Function(
                  IrisVideoFrameBufferManagerPtr,
                  ffi.Pointer<IrisVideoFrameBufferConfig>,
                  IrisVideoFrameBufferDelegateHandle)>>(
      'DisableVideoFrameBufferByConfig');
  late final _DisableVideoFrameBufferByConfig =
      _DisableVideoFrameBufferByConfigPtr.asFunction<
          void Function(
              IrisVideoFrameBufferManagerPtr,
              ffi.Pointer<IrisVideoFrameBufferConfig>,
              IrisVideoFrameBufferDelegateHandle)>();

  void DisableAllVideoFrameBuffer(
    IrisVideoFrameBufferManagerPtr manager_ptr,
  ) {
    return _DisableAllVideoFrameBuffer(
      manager_ptr,
    );
  }

  late final _DisableAllVideoFrameBufferPtr = _lookup<
      ffi.NativeFunction<
          ffi.Void Function(
              IrisVideoFrameBufferManagerPtr)>>('DisableAllVideoFrameBuffer');
  late final _DisableAllVideoFrameBuffer = _DisableAllVideoFrameBufferPtr
      .asFunction<void Function(IrisVideoFrameBufferManagerPtr)>();

  int GetVideoFrame(
    IrisVideoFrameBufferManagerPtr manager_ptr,
    ffi.Pointer<IrisVideoFrame> video_frame,
    ffi.Pointer<ffi.Int32> is_new_frame,
    int uid,
    ffi.Pointer<ffi.Int8> channel_id,
  ) {
    return _GetVideoFrame(
      manager_ptr,
      video_frame,
      is_new_frame,
      uid,
      channel_id,
    );
  }

  late final _GetVideoFramePtr = _lookup<
      ffi.NativeFunction<
          ffi.Int32 Function(
              IrisVideoFrameBufferManagerPtr,
              ffi.Pointer<IrisVideoFrame>,
              ffi.Pointer<ffi.Int32>,
              ffi.Uint32,
              ffi.Pointer<ffi.Int8>)>>('GetVideoFrame');
  late final _GetVideoFrame = _GetVideoFramePtr.asFunction<
      int Function(IrisVideoFrameBufferManagerPtr, ffi.Pointer<IrisVideoFrame>,
          ffi.Pointer<ffi.Int32>, int, ffi.Pointer<ffi.Int8>)>();

  int GetVideoFrameByConfig(
    IrisVideoFrameBufferManagerPtr manager_ptr,
    ffi.Pointer<IrisVideoFrame> video_frame,
    ffi.Pointer<ffi.Int32> is_new_frame,
    ffi.Pointer<IrisVideoFrameBufferConfig> config,
  ) {
    return _GetVideoFrameByConfig(
      manager_ptr,
      video_frame,
      is_new_frame,
      config,
    );
  }

  late final _GetVideoFrameByConfigPtr = _lookup<
          ffi.NativeFunction<
              ffi.Int32 Function(
                  IrisVideoFrameBufferManagerPtr,
                  ffi.Pointer<IrisVideoFrame>,
                  ffi.Pointer<ffi.Int32>,
                  ffi.Pointer<IrisVideoFrameBufferConfig>)>>(
      'GetVideoFrameByConfig');
  late final _GetVideoFrameByConfig = _GetVideoFrameByConfigPtr.asFunction<
      int Function(IrisVideoFrameBufferManagerPtr, ffi.Pointer<IrisVideoFrame>,
          ffi.Pointer<ffi.Int32>, ffi.Pointer<IrisVideoFrameBufferConfig>)>();

  int StartDumpVideo(
    IrisVideoFrameBufferManagerPtr manager_ptr,
    int type,
    ffi.Pointer<ffi.Int8> dir,
  ) {
    return _StartDumpVideo(
      manager_ptr,
      type,
      dir,
    );
  }

  late final _StartDumpVideoPtr = _lookup<
      ffi.NativeFunction<
          ffi.Int32 Function(IrisVideoFrameBufferManagerPtr, ffi.Int32,
              ffi.Pointer<ffi.Int8>)>>('StartDumpVideo');
  late final _StartDumpVideo = _StartDumpVideoPtr.asFunction<
      int Function(
          IrisVideoFrameBufferManagerPtr, int, ffi.Pointer<ffi.Int8>)>();

  int StopDumpVideo(
    IrisVideoFrameBufferManagerPtr manager_ptr,
  ) {
    return _StopDumpVideo(
      manager_ptr,
    );
  }

  late final _StopDumpVideoPtr = _lookup<
      ffi.NativeFunction<
          ffi.Int32 Function(IrisVideoFrameBufferManagerPtr)>>('StopDumpVideo');
  late final _StopDumpVideo = _StopDumpVideoPtr.asFunction<
      int Function(IrisVideoFrameBufferManagerPtr)>();

  int CallIrisApi(
    IrisApiEnginePtr engine_ptr,
    ffi.Pointer<ApiParam> param,
  ) {
    return _CallIrisApi(
      engine_ptr,
      param,
    );
  }

  late final _CallIrisApiPtr = _lookup<
      ffi.NativeFunction<
          ffi.Int32 Function(
              IrisApiEnginePtr, ffi.Pointer<ApiParam>)>>('CallIrisApi');
  late final _CallIrisApi = _CallIrisApiPtr.asFunction<
      int Function(IrisApiEnginePtr, ffi.Pointer<ApiParam>)>();

  /// IrisRtcEngine
  IrisApiEnginePtr CreateIrisApiEngine(
    ffi.Pointer<ffi.Void> rtcEngine,
  ) {
    return _CreateIrisApiEngine(
      rtcEngine,
    );
  }

  late final _CreateIrisApiEnginePtr = _lookup<
          ffi.NativeFunction<IrisApiEnginePtr Function(ffi.Pointer<ffi.Void>)>>(
      'CreateIrisApiEngine');
  late final _CreateIrisApiEngine = _CreateIrisApiEnginePtr.asFunction<
      IrisApiEnginePtr Function(ffi.Pointer<ffi.Void>)>();

  void DestroyIrisApiEngine(
    IrisApiEnginePtr engine_ptr,
  ) {
    return _DestroyIrisApiEngine(
      engine_ptr,
    );
  }

  late final _DestroyIrisApiEnginePtr =
      _lookup<ffi.NativeFunction<ffi.Void Function(IrisApiEnginePtr)>>(
          'DestroyIrisApiEngine');
  late final _DestroyIrisApiEngine =
      _DestroyIrisApiEnginePtr.asFunction<void Function(IrisApiEnginePtr)>();

  IrisEventHandlerHandle CreateIrisEventHandler(
    ffi.Pointer<IrisCEventHandler> event_handler,
  ) {
    return _CreateIrisEventHandler(
      event_handler,
    );
  }

  late final _CreateIrisEventHandlerPtr = _lookup<
      ffi.NativeFunction<
          IrisEventHandlerHandle Function(
              ffi.Pointer<IrisCEventHandler>)>>('CreateIrisEventHandler');
  late final _CreateIrisEventHandler = _CreateIrisEventHandlerPtr.asFunction<
      IrisEventHandlerHandle Function(ffi.Pointer<IrisCEventHandler>)>();

  void DestroyIrisEventHandler(
    IrisEventHandlerHandle handler,
  ) {
    return _DestroyIrisEventHandler(
      handler,
    );
  }

  late final _DestroyIrisEventHandlerPtr =
      _lookup<ffi.NativeFunction<ffi.Void Function(IrisEventHandlerHandle)>>(
          'DestroyIrisEventHandler');
  late final _DestroyIrisEventHandler = _DestroyIrisEventHandlerPtr.asFunction<
      void Function(IrisEventHandlerHandle)>();

  /// IrisRtcRawData
  int Attach(
    IrisApiEnginePtr engine_ptr,
    IrisVideoFrameBufferManagerPtr manager_ptr,
  ) {
    return _Attach(
      engine_ptr,
      manager_ptr,
    );
  }

  late final _AttachPtr = _lookup<
      ffi.NativeFunction<
          ffi.Int32 Function(
              IrisApiEnginePtr, IrisVideoFrameBufferManagerPtr)>>('Attach');
  late final _Attach = _AttachPtr.asFunction<
      int Function(IrisApiEnginePtr, IrisVideoFrameBufferManagerPtr)>();

  int Detach(
    IrisApiEnginePtr engine_ptr,
    IrisVideoFrameBufferManagerPtr manager_ptr,
  ) {
    return _Detach(
      engine_ptr,
      manager_ptr,
    );
  }

  late final _DetachPtr = _lookup<
      ffi.NativeFunction<
          ffi.Int32 Function(
              IrisApiEnginePtr, IrisVideoFrameBufferManagerPtr)>>('Detach');
  late final _Detach = _DetachPtr.asFunction<
      int Function(IrisApiEnginePtr, IrisVideoFrameBufferManagerPtr)>();
}

abstract class IrisAppType {
  static const int kAppTypeNative = 0;
  static const int kAppTypeCocos = 1;
  static const int kAppTypeUnity = 2;
  static const int kAppTypeElectron = 3;
  static const int kAppTypeFlutter = 4;
  static const int kAppTypeUnreal = 5;
  static const int kAppTypeXamarin = 6;
  static const int kAppTypeApiCloud = 7;
  static const int kAppTypeReactNative = 8;
  static const int kAppTypePython = 9;
  static const int kAppTypeCocosCreator = 10;
  static const int kAppTypeRust = 11;
  static const int kAppTypeCSharp = 12;
  static const int kAppTypeCef = 13;
  static const int kAppTypeUniApp = 14;
}

abstract class IrisLogLevel {
  static const int LOG_LEVEL_TRACE = 0;
  static const int LOG_LEVEL_DEBUG = 1;
  static const int LOG_LEVEL_INFO = 2;
  static const int LOG_LEVEL_WARN = 3;
  static const int LOG_LEVEL_ERROR = 4;
  static const int LOG_LEVEL_CRITICAL = 5;
  static const int LOG_LEVEL_OFF = 6;
}

class EventParam extends ffi.Struct {
  external ffi.Pointer<ffi.Int8> event;

  external ffi.Pointer<ffi.Int8> data;

  @ffi.Uint32()
  external int data_size;

  external ffi.Pointer<ffi.Int8> result;

  external ffi.Pointer<ffi.Pointer<ffi.Void>> buffer;

  external ffi.Pointer<ffi.Uint32> length;

  @ffi.Uint32()
  external int buffer_count;
}

class IrisCEventHandler extends ffi.Struct {
  external Func_Event OnEvent;
}

typedef Func_Event = ffi
    .Pointer<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<EventParam>)>>;

/// The agora::media::base::VideoFrame C projection but remove some unsupported property in C,
/// e.g., agora::media::base::VideoFrame.sharedContext, agora::media::base::VideoFrame.textureId, etc.
///
/// NOTE: If the agora::media::base::VideoFrame is updated, make sure this struct be up to date.
/// TODO(littlegnal): maybe we can use terra to generate the C projection.
class IrisCVideoFrame extends ffi.Struct {
  /// The agora::media::base::VideoFrame.type, but convert it to int type
  @ffi.Int32()
  external int type;

  @ffi.Int32()
  external int width;

  @ffi.Int32()
  external int height;

  @ffi.Int32()
  external int yStride;

  @ffi.Int32()
  external int uStride;

  @ffi.Int32()
  external int vStride;

  external ffi.Pointer<ffi.Uint8> yBuffer;

  external ffi.Pointer<ffi.Uint8> uBuffer;

  external ffi.Pointer<ffi.Uint8> vBuffer;

  @ffi.Int32()
  external int rotation;

  @ffi.Int64()
  external int renderTimeMs;

  @ffi.Int32()
  external int avsync_type;

  external ffi.Pointer<ffi.Uint8> metadata_buffer;

  @ffi.Int32()
  external int metadata_size;

  @ffi.Array.multi([16])
  external ffi.Array<ffi.Float> matrix;

  external ffi.Pointer<ffi.Uint8> alphaBuffer;
}

class IrisRtcVideoFrameConfig extends ffi.Struct {
  /// int value of agora::rtc::VIDEO_SOURCE_TYPE
  @ffi.Int32()
  external int video_source_type;

  /// int value of agora::media::base::VIDEO_PIXEL_FORMAT. use in convertFrame()
  @ffi.Int32()
  external int video_frame_format;

  @ffi.Uint32()
  external int uid;

  @ffi.Array.multi([512])
  external ffi.Array<ffi.Int8> channelId;
}

abstract class GET_VIDEO_FRAME_CACHE_RETURN_TYPE {
  static const int OK = 0;
  static const int RESIZED = 1;
  static const int NO_CACHE = 2;
}

typedef IrisRtcRenderingHandle = ffi.Pointer<ffi.Void>;

abstract class IRIS_VIDEO_PROCESS_ERR {
  static const int ERR_OK = 0;
  static const int ERR_NULL_POINTER = 1;
  static const int ERR_SIZE_NOT_MATCHING = 2;
  static const int ERR_BUFFER_EMPTY = 5;
  static const int ERR_FRAM_TYPE_NOT_MATCHING = 6;
}

class IrisVideoFrameBufferConfig extends ffi.Struct {
  @ffi.Int32()
  external int type;

  @ffi.Uint32()
  external int id;

  @ffi.Array.multi([512])
  external ffi.Array<ffi.Int8> key;
}

abstract class IrisVideoSourceType {
  static const int kVideoSourceTypeCameraPrimary = 0;
  static const int kVideoSourceTypeCameraSecondary = 1;
  static const int kVideoSourceTypeScreenPrimary = 2;
  static const int kVideoSourceTypeScreenSecondary = 3;
  static const int kVideoSourceTypeCustom = 4;
  static const int kVideoSourceTypeMediaPlayer = 5;
  static const int kVideoSourceTypeRtcImagePng = 6;
  static const int kVideoSourceTypeRtcImageJpeg = 7;
  static const int kVideoSourceTypeRtcImageGif = 8;
  static const int kVideoSourceTypeRemote = 9;
  static const int kVideoSourceTypeTranscoded = 10;
  static const int kVideoSourceTypeCameraThird = 11;
  static const int kVideoSourceTypeCameraFourth = 12;
  static const int kVideoSourceTypeScreenThird = 13;
  static const int kVideoSourceTypeScreenFourth = 14;
  static const int kVideoSourceTypePreEncodeCameraPrimary = 40;
  static const int kVideoSourceTypePreEncodeCameraSecondary = 41;
  static const int kVideoSourceTypePreEncodeCameraThird = 42;
  static const int kVideoSourceTypePreEncodeCameraFourth = 43;
  static const int kVideoSourceTypePreEncodeScreenPrimary = 44;
  static const int kVideoSourceTypePreEncodeScreenSecondary = 45;
  static const int kVideoSourceTypePreEncodeScreenThrid = 46;
  static const int kVideoSourceTypePreEncodeScreenFourth = 47;
  static const int kVideoSourceTypeUnknown = 100;
}

class IrisCVideoFrameBuffer extends ffi.Struct {
  @ffi.Int32()
  external int type;

  external Func_VideoFrame OnVideoFrameReceived;

  @ffi.Int32()
  external int bytes_per_row_alignment;
}

abstract class IrisVideoFrameType {
  static const int kVideoFrameTypeYUV420 = 1;
  static const int kVideoFrameTypeYUV422 = 16;
  static const int kVideoFrameTypeRGBA = 4;
  static const int kVideoFrameTypeBGRA = 2;
}

typedef Func_VideoFrame = ffi.Pointer<
    ffi.NativeFunction<
        ffi.Void Function(ffi.Pointer<IrisVideoFrame>,
            ffi.Pointer<IrisVideoFrameBufferConfig>, ffi.Int32)>>;

class IrisVideoFrame extends ffi.Struct {
  @ffi.Int32()
  external int type;

  @ffi.Int32()
  external int width;

  @ffi.Int32()
  external int height;

  @ffi.Int32()
  external int y_stride;

  @ffi.Int32()
  external int u_stride;

  @ffi.Int32()
  external int v_stride;

  external ffi.Pointer<ffi.Void> y_buffer;

  external ffi.Pointer<ffi.Void> u_buffer;

  external ffi.Pointer<ffi.Void> v_buffer;

  @ffi.Uint32()
  external int y_buffer_length;

  @ffi.Uint32()
  external int u_buffer_length;

  @ffi.Uint32()
  external int v_buffer_length;

  @ffi.Int32()
  external int rotation;

  @ffi.Int64()
  external int render_time_ms;

  @ffi.Int32()
  external int av_sync_type;

  external ffi.Pointer<ffi.Void> metadata_buffer;

  @ffi.Int32()
  external int metadata_size;

  external ffi.Pointer<ffi.Void> sharedContext;

  @ffi.Int32()
  external int textureId;

  @ffi.Array.multi([16])
  external ffi.Array<ffi.Float> matrix;

  external ffi.Pointer<ffi.Void> alphaBuffer;
}

typedef IrisVideoFrameBufferManagerPtr = ffi.Pointer<ffi.Void>;
typedef IrisVideoFrameBufferDelegateHandle = ffi.Pointer<ffi.Void>;

abstract class IRIS_API_ERROR_CODE_TYPE {
  static const int IRIS_API_NOT_CREATE = 666666;
}

typedef IrisApiEnginePtr = ffi.Pointer<ffi.Void>;
typedef ApiParam = EventParam;
typedef IrisEventHandlerHandle = ffi.Pointer<ffi.Void>;

const int kBasicResultLength = 65536;

const int kEventResultLenght = 1024;

const int kBasicStringLength = 512;

const int kDefaultLogFileSize = 5242880;
