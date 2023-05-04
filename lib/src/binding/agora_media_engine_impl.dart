import 'package:agora_rtc_engine/src/binding_forward_export.dart';
import 'package:agora_rtc_engine/src/binding/impl_forward_export.dart';
import 'package:iris_method_channel/iris_method_channel.dart';
// ignore_for_file: public_member_api_docs, unused_local_variable, annotate_overrides

class MediaEngineImpl implements MediaEngine {
  MediaEngineImpl(this.irisMethodChannel);

  @protected
  final IrisMethodChannel irisMethodChannel;

  @protected
  Map<String, dynamic> createParams(Map<String, dynamic> param) {
    return param;
  }

  @protected
  bool get isOverrideClassName => false;

  @protected
  String get className => 'MediaEngine';

  @override
  void registerAudioFrameObserver(AudioFrameObserver observer) {
// Implementation template
// final apiType = '${isOverrideClassName ? className : 'MediaEngine'}_registerAudioFrameObserver';
// final param = createParams({// 'observer':observer// });
// final callApiResult =  irisMethodChannel.invokeMethod(IrisMethodCall(apiType, jsonEncode(param), buffers:null));
// if (callApiResult.irisReturnCode < 0) {
// throw AgoraRtcException(code: callApiResult.irisReturnCode);
// }
// final rm = callApiResult.data;
// final result = rm['result'];
// if (result < 0) {
// throw AgoraRtcException(code: result);
// }
    throw UnimplementedError('Unimplement for registerAudioFrameObserver');
  }

  @override
  void registerVideoFrameObserver(VideoFrameObserver observer) {
// Implementation template
// final apiType = '${isOverrideClassName ? className : 'MediaEngine'}_registerVideoFrameObserver';
// final param = createParams({// 'observer':observer// });
// final callApiResult =  irisMethodChannel.invokeMethod(IrisMethodCall(apiType, jsonEncode(param), buffers:null));
// if (callApiResult.irisReturnCode < 0) {
// throw AgoraRtcException(code: callApiResult.irisReturnCode);
// }
// final rm = callApiResult.data;
// final result = rm['result'];
// if (result < 0) {
// throw AgoraRtcException(code: result);
// }
    throw UnimplementedError('Unimplement for registerVideoFrameObserver');
  }

  @override
  void registerVideoEncodedFrameObserver(VideoEncodedFrameObserver observer) {
// Implementation template
// final apiType = '${isOverrideClassName ? className : 'MediaEngine'}_registerVideoEncodedFrameObserver';
// final param = createParams({// 'observer':observer// });
// final callApiResult =  irisMethodChannel.invokeMethod(IrisMethodCall(apiType, jsonEncode(param), buffers:null));
// if (callApiResult.irisReturnCode < 0) {
// throw AgoraRtcException(code: callApiResult.irisReturnCode);
// }
// final rm = callApiResult.data;
// final result = rm['result'];
// if (result < 0) {
// throw AgoraRtcException(code: result);
// }
    throw UnimplementedError(
        'Unimplement for registerVideoEncodedFrameObserver');
  }

  @override
  Future<void> pushAudioFrame(
      {required AudioFrame frame, int trackId = 0}) async {
    final apiType =
        '${isOverrideClassName ? className : 'MediaEngine'}_pushAudioFrame';
    final param = createParams({'frame': frame.toJson(), 'trackId': trackId});
    final List<Uint8List> buffers = [];
    buffers.addAll(frame.collectBufferList());
    final callApiResult = await irisMethodChannel.invokeMethod(
        IrisMethodCall(apiType, jsonEncode(param), buffers: buffers));
    if (callApiResult.irisReturnCode < 0) {
      throw AgoraRtcException(code: callApiResult.irisReturnCode);
    }
    final rm = callApiResult.data;
    final result = rm['result'];
    if (result < 0) {
      throw AgoraRtcException(code: result);
    }
  }

  @override
  Future<void> pullAudioFrame(AudioFrame frame) async {
    final apiType =
        '${isOverrideClassName ? className : 'MediaEngine'}_pullAudioFrame';
    final param = createParams({'frame': frame.toJson()});
    final List<Uint8List> buffers = [];
    buffers.addAll(frame.collectBufferList());
    final callApiResult = await irisMethodChannel.invokeMethod(
        IrisMethodCall(apiType, jsonEncode(param), buffers: buffers));
    if (callApiResult.irisReturnCode < 0) {
      throw AgoraRtcException(code: callApiResult.irisReturnCode);
    }
    final rm = callApiResult.data;
    final result = rm['result'];
    if (result < 0) {
      throw AgoraRtcException(code: result);
    }
  }

  @override
  Future<void> setExternalVideoSource(
      {required bool enabled,
      required bool useTexture,
      ExternalVideoSourceType sourceType = ExternalVideoSourceType.videoFrame,
      SenderOptions encodedVideoOption = const SenderOptions()}) async {
    final apiType =
        '${isOverrideClassName ? className : 'MediaEngine'}_setExternalVideoSource';
    final param = createParams({
      'enabled': enabled,
      'useTexture': useTexture,
      'sourceType': sourceType.value(),
      'encodedVideoOption': encodedVideoOption.toJson()
    });
    final List<Uint8List> buffers = [];
    buffers.addAll(encodedVideoOption.collectBufferList());
    final callApiResult = await irisMethodChannel.invokeMethod(
        IrisMethodCall(apiType, jsonEncode(param), buffers: buffers));
    if (callApiResult.irisReturnCode < 0) {
      throw AgoraRtcException(code: callApiResult.irisReturnCode);
    }
    final rm = callApiResult.data;
    final result = rm['result'];
    if (result < 0) {
      throw AgoraRtcException(code: result);
    }
  }

  @override
  Future<void> setExternalAudioSource(
      {required bool enabled,
      required int sampleRate,
      required int channels,
      bool localPlayback = false,
      bool publish = true}) async {
    final apiType =
        '${isOverrideClassName ? className : 'MediaEngine'}_setExternalAudioSource';
    final param = createParams({
      'enabled': enabled,
      'sampleRate': sampleRate,
      'channels': channels,
      'localPlayback': localPlayback,
      'publish': publish
    });
    final callApiResult = await irisMethodChannel.invokeMethod(
        IrisMethodCall(apiType, jsonEncode(param), buffers: null));
    if (callApiResult.irisReturnCode < 0) {
      throw AgoraRtcException(code: callApiResult.irisReturnCode);
    }
    final rm = callApiResult.data;
    final result = rm['result'];
    if (result < 0) {
      throw AgoraRtcException(code: result);
    }
  }

  @override
  Future<int> createCustomAudioTrack(
      {required AudioTrackType trackType,
      required AudioTrackConfig config}) async {
    final apiType =
        '${isOverrideClassName ? className : 'MediaEngine'}_createCustomAudioTrack';
    final param = createParams(
        {'trackType': trackType.value(), 'config': config.toJson()});
    final List<Uint8List> buffers = [];
    buffers.addAll(config.collectBufferList());
    final callApiResult = await irisMethodChannel.invokeMethod(
        IrisMethodCall(apiType, jsonEncode(param), buffers: buffers));
    if (callApiResult.irisReturnCode < 0) {
      throw AgoraRtcException(code: callApiResult.irisReturnCode);
    }
    final rm = callApiResult.data;
    final result = rm['result'];
    return result as int;
  }

  @override
  Future<void> destroyCustomAudioTrack(int trackId) async {
    final apiType =
        '${isOverrideClassName ? className : 'MediaEngine'}_destroyCustomAudioTrack';
    final param = createParams({'trackId': trackId});
    final callApiResult = await irisMethodChannel.invokeMethod(
        IrisMethodCall(apiType, jsonEncode(param), buffers: null));
    if (callApiResult.irisReturnCode < 0) {
      throw AgoraRtcException(code: callApiResult.irisReturnCode);
    }
    final rm = callApiResult.data;
    final result = rm['result'];
    if (result < 0) {
      throw AgoraRtcException(code: result);
    }
  }

  @override
  Future<void> setExternalAudioSink(
      {required bool enabled,
      required int sampleRate,
      required int channels}) async {
    final apiType =
        '${isOverrideClassName ? className : 'MediaEngine'}_setExternalAudioSink';
    final param = createParams(
        {'enabled': enabled, 'sampleRate': sampleRate, 'channels': channels});
    final callApiResult = await irisMethodChannel.invokeMethod(
        IrisMethodCall(apiType, jsonEncode(param), buffers: null));
    if (callApiResult.irisReturnCode < 0) {
      throw AgoraRtcException(code: callApiResult.irisReturnCode);
    }
    final rm = callApiResult.data;
    final result = rm['result'];
    if (result < 0) {
      throw AgoraRtcException(code: result);
    }
  }

  @override
  Future<void> enableCustomAudioLocalPlayback(
      {required int trackId, required bool enabled}) async {
    final apiType =
        '${isOverrideClassName ? className : 'MediaEngine'}_enableCustomAudioLocalPlayback';
    final param = createParams({'trackId': trackId, 'enabled': enabled});
    final callApiResult = await irisMethodChannel.invokeMethod(
        IrisMethodCall(apiType, jsonEncode(param), buffers: null));
    if (callApiResult.irisReturnCode < 0) {
      throw AgoraRtcException(code: callApiResult.irisReturnCode);
    }
    final rm = callApiResult.data;
    final result = rm['result'];
    if (result < 0) {
      throw AgoraRtcException(code: result);
    }
  }

  @override
  Future<void> pushVideoFrame(
      {required ExternalVideoFrame frame, int videoTrackId = 0}) async {
    final apiType =
        '${isOverrideClassName ? className : 'MediaEngine'}_pushVideoFrame';
    final param =
        createParams({'frame': frame.toJson(), 'videoTrackId': videoTrackId});
    final List<Uint8List> buffers = [];
    buffers.addAll(frame.collectBufferList());
    final callApiResult = await irisMethodChannel.invokeMethod(
        IrisMethodCall(apiType, jsonEncode(param), buffers: buffers));
    if (callApiResult.irisReturnCode < 0) {
      throw AgoraRtcException(code: callApiResult.irisReturnCode);
    }
    final rm = callApiResult.data;
    final result = rm['result'];
    if (result < 0) {
      throw AgoraRtcException(code: result);
    }
  }

  @override
  Future<void> pushEncodedVideoImage(
      {required Uint8List imageBuffer,
      required int length,
      required EncodedVideoFrameInfo videoEncodedFrameInfo,
      int videoTrackId = 0}) async {
    final apiType =
        '${isOverrideClassName ? className : 'MediaEngine'}_pushEncodedVideoImage';
    final param = createParams({
      'length': length,
      'videoEncodedFrameInfo': videoEncodedFrameInfo.toJson(),
      'videoTrackId': videoTrackId
    });
    final List<Uint8List> buffers = [];
    buffers.add(imageBuffer);
    buffers.addAll(videoEncodedFrameInfo.collectBufferList());
    final callApiResult = await irisMethodChannel.invokeMethod(
        IrisMethodCall(apiType, jsonEncode(param), buffers: buffers));
    if (callApiResult.irisReturnCode < 0) {
      throw AgoraRtcException(code: callApiResult.irisReturnCode);
    }
    final rm = callApiResult.data;
    final result = rm['result'];
    if (result < 0) {
      throw AgoraRtcException(code: result);
    }
  }

  @override
  Future<void> release() async {
    final apiType =
        '${isOverrideClassName ? className : 'MediaEngine'}_release';
    final param = createParams({});
    final callApiResult = await irisMethodChannel.invokeMethod(
        IrisMethodCall(apiType, jsonEncode(param), buffers: null));
    if (callApiResult.irisReturnCode < 0) {
      throw AgoraRtcException(code: callApiResult.irisReturnCode);
    }
    final rm = callApiResult.data;
    final result = rm['result'];
    if (result < 0) {
      throw AgoraRtcException(code: result);
    }
  }

  @override
  void unregisterAudioFrameObserver(AudioFrameObserver observer) {
// Implementation template
// final apiType = '${isOverrideClassName ? className : 'MediaEngine'}_unregisterAudioFrameObserver';
// final param = createParams({// 'observer':observer// });
// final callApiResult =  irisMethodChannel.invokeMethod(IrisMethodCall(apiType, jsonEncode(param), buffers:null));
// if (callApiResult.irisReturnCode < 0) {
// throw AgoraRtcException(code: callApiResult.irisReturnCode);
// }
// final rm = callApiResult.data;
// final result = rm['result'];
    throw UnimplementedError('Unimplement for unregisterAudioFrameObserver');
  }

  @override
  void unregisterVideoFrameObserver(VideoFrameObserver observer) {
// Implementation template
// final apiType = '${isOverrideClassName ? className : 'MediaEngine'}_unregisterVideoFrameObserver';
// final param = createParams({// 'observer':observer// });
// final callApiResult =  irisMethodChannel.invokeMethod(IrisMethodCall(apiType, jsonEncode(param), buffers:null));
// if (callApiResult.irisReturnCode < 0) {
// throw AgoraRtcException(code: callApiResult.irisReturnCode);
// }
// final rm = callApiResult.data;
// final result = rm['result'];
    throw UnimplementedError('Unimplement for unregisterVideoFrameObserver');
  }

  @override
  void unregisterVideoEncodedFrameObserver(VideoEncodedFrameObserver observer) {
// Implementation template
// final apiType = '${isOverrideClassName ? className : 'MediaEngine'}_unregisterVideoEncodedFrameObserver';
// final param = createParams({// 'observer':observer// });
// final callApiResult =  irisMethodChannel.invokeMethod(IrisMethodCall(apiType, jsonEncode(param), buffers:null));
// if (callApiResult.irisReturnCode < 0) {
// throw AgoraRtcException(code: callApiResult.irisReturnCode);
// }
// final rm = callApiResult.data;
// final result = rm['result'];
    throw UnimplementedError(
        'Unimplement for unregisterVideoEncodedFrameObserver');
  }
}
