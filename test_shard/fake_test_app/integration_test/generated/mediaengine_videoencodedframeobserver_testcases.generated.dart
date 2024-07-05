/// GENERATED BY testcase_gen. DO NOT MODIFY BY HAND.

// ignore_for_file: deprecated_member_use,constant_identifier_names

import 'dart:async';
import 'dart:typed_data';

import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:iris_tester/iris_tester.dart';
import 'package:iris_method_channel/iris_method_channel.dart';

import '../testcases/event_ids_mapping.dart';

void generatedTestCases(ValueGetter<IrisTester> irisTester) {
  testWidgets(
    'VideoEncodedFrameObserver.onEncodedVideoFrameReceived',
    (WidgetTester tester) async {
      RtcEngine rtcEngine = createAgoraRtcEngine();
      await rtcEngine.initialize(RtcEngineContext(
        appId: 'app_id',
        areaCode: AreaCode.areaCodeGlob.value(),
      ));
      await rtcEngine.setParameters('{"rtc.enable_debug_log": true}');
      final mediaEngine = rtcEngine.getMediaEngine();

      final onEncodedVideoFrameReceivedCompleter = Completer<bool>();
      final theVideoEncodedFrameObserver = VideoEncodedFrameObserver(
        onEncodedVideoFrameReceived: (int uid, Uint8List imageBuffer,
            int length, EncodedVideoFrameInfo videoEncodedFrameInfo) {
          onEncodedVideoFrameReceivedCompleter.complete(true);
        },
      );

      mediaEngine.registerVideoEncodedFrameObserver(
        theVideoEncodedFrameObserver,
      );

// Delay 500 milliseconds to ensure the registerVideoEncodedFrameObserver call completed.
      await Future.delayed(const Duration(milliseconds: 500));

      {
        const int uid = 10;
        Uint8List imageBuffer = Uint8List.fromList([1, 2, 3, 4, 5]);
        const int length = 10;
        const VideoCodecType videoEncodedFrameInfoCodecType =
            VideoCodecType.videoCodecNone;
        const VideoFrameType videoEncodedFrameInfoFrameType =
            VideoFrameType.videoFrameTypeBlankFrame;
        const VideoOrientation videoEncodedFrameInfoRotation =
            VideoOrientation.videoOrientation0;
        const VideoStreamType videoEncodedFrameInfoStreamType =
            VideoStreamType.videoStreamHigh;
        const int videoEncodedFrameInfoUid = 10;
        const int videoEncodedFrameInfoWidth = 10;
        const int videoEncodedFrameInfoHeight = 10;
        const int videoEncodedFrameInfoFramesPerSecond = 10;
        const int videoEncodedFrameInfoTrackId = 10;
        const int videoEncodedFrameInfoCaptureTimeMs = 10;
        const int videoEncodedFrameInfoDecodeTimeMs = 10;
        const int videoEncodedFrameInfoPresentationMs = 10;
        const EncodedVideoFrameInfo videoEncodedFrameInfo =
            EncodedVideoFrameInfo(
          uid: videoEncodedFrameInfoUid,
          codecType: videoEncodedFrameInfoCodecType,
          width: videoEncodedFrameInfoWidth,
          height: videoEncodedFrameInfoHeight,
          framesPerSecond: videoEncodedFrameInfoFramesPerSecond,
          frameType: videoEncodedFrameInfoFrameType,
          rotation: videoEncodedFrameInfoRotation,
          trackId: videoEncodedFrameInfoTrackId,
          captureTimeMs: videoEncodedFrameInfoCaptureTimeMs,
          decodeTimeMs: videoEncodedFrameInfoDecodeTimeMs,
          streamType: videoEncodedFrameInfoStreamType,
          presentationMs: videoEncodedFrameInfoPresentationMs,
        );

        final eventJson = {
          'uid': uid,
          'imageBuffer': imageBuffer.toList(),
          'length': length,
          'videoEncodedFrameInfo': videoEncodedFrameInfo.toJson(),
        };

        final eventIds = eventIdsMapping[
                'VideoEncodedFrameObserver_onEncodedVideoFrameReceived'] ??
            [];
        for (final event in eventIds) {
          final ret = irisTester().fireEvent(event, params: eventJson);
          // Delay 200 milliseconds to ensure the callback is called.
          await Future.delayed(const Duration(milliseconds: 200));
          // TODO(littlegnal): Most of callbacks on web are not implemented, we're temporarily skip these callbacks at this time.
          if (kIsWeb && ret) {
            if (!onEncodedVideoFrameReceivedCompleter.isCompleted) {
              onEncodedVideoFrameReceivedCompleter.complete(true);
            }
          }
        }
      }

      final eventCalled = await onEncodedVideoFrameReceivedCompleter.future;
      expect(eventCalled, isTrue);

      {
        mediaEngine.unregisterVideoEncodedFrameObserver(
          theVideoEncodedFrameObserver,
        );
      }
// Delay 500 milliseconds to ensure the unregisterVideoEncodedFrameObserver call completed.
      await Future.delayed(const Duration(milliseconds: 500));

      await rtcEngine.release();
    },
    timeout: const Timeout(Duration(minutes: 2)),
  );
}

