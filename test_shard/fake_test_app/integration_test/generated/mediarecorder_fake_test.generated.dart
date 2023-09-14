/// GENERATED BY testcase_gen. DO NOT MODIFY BY HAND.

// ignore_for_file: deprecated_member_use,constant_identifier_names

import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/foundation.dart';
import 'package:fake_test_app/main.dart' as app;
import 'package:iris_tester/iris_tester.dart';
import 'package:iris_method_channel/iris_method_channel.dart';

void mediaRecorderSmokeTestCases() {
  testWidgets(
    'setMediaRecorderObserver',
    (WidgetTester tester) async {
      String engineAppId = const String.fromEnvironment('TEST_APP_ID',
          defaultValue: '<YOUR_APP_ID>');

      RtcEngine rtcEngine = createAgoraRtcEngine();
      await rtcEngine.initialize(RtcEngineContext(
        appId: engineAppId,
        areaCode: AreaCode.areaCodeGlob.value(),
      ));

      final mediaRecorder = (await rtcEngine.createMediaRecorder(
          RecorderStreamInfo(channelId: 'hello', uid: 0)))!;

      try {
        final MediaRecorderObserver callback = MediaRecorderObserver(
          onRecorderStateChanged: (String channelId, int uid,
              RecorderState state, RecorderErrorCode error) {},
          onRecorderInfoUpdated:
              (String channelId, int uid, RecorderInfo info) {},
        );
        await mediaRecorder.setMediaRecorderObserver(
          callback,
        );
      } catch (e) {
        if (e is! AgoraRtcException) {
          debugPrint('[setMediaRecorderObserver] error: ${e.toString()}');
          rethrow;
        }

        if (e.code != -4) {
          // Only not supported error supported.
          rethrow;
        }
      }

      await rtcEngine.destroyMediaRecorder(mediaRecorder);
      await rtcEngine.release();
    },
//  skip: !(),
  );

  testWidgets(
    'startRecording',
    (WidgetTester tester) async {
      String engineAppId = const String.fromEnvironment('TEST_APP_ID',
          defaultValue: '<YOUR_APP_ID>');

      RtcEngine rtcEngine = createAgoraRtcEngine();
      await rtcEngine.initialize(RtcEngineContext(
        appId: engineAppId,
        areaCode: AreaCode.areaCodeGlob.value(),
      ));

      final mediaRecorder = (await rtcEngine.createMediaRecorder(
          RecorderStreamInfo(channelId: 'hello', uid: 0)))!;

      try {
        const MediaRecorderContainerFormat configContainerFormat =
            MediaRecorderContainerFormat.formatMp4;
        const MediaRecorderStreamType configStreamType =
            MediaRecorderStreamType.streamTypeAudio;
        const String configStoragePath = "hello";
        const int configMaxDurationMs = 10;
        const int configRecorderInfoUpdateInterval = 10;
        const MediaRecorderConfiguration config = MediaRecorderConfiguration(
          storagePath: configStoragePath,
          containerFormat: configContainerFormat,
          streamType: configStreamType,
          maxDurationMs: configMaxDurationMs,
          recorderInfoUpdateInterval: configRecorderInfoUpdateInterval,
        );
        await mediaRecorder.startRecording(
          config,
        );
      } catch (e) {
        if (e is! AgoraRtcException) {
          debugPrint('[startRecording] error: ${e.toString()}');
          rethrow;
        }

        if (e.code != -4) {
          // Only not supported error supported.
          rethrow;
        }
      }

      await rtcEngine.destroyMediaRecorder(mediaRecorder);
      await rtcEngine.release();
    },
//  skip: !(),
  );

  testWidgets(
    'stopRecording',
    (WidgetTester tester) async {
      String engineAppId = const String.fromEnvironment('TEST_APP_ID',
          defaultValue: '<YOUR_APP_ID>');

      RtcEngine rtcEngine = createAgoraRtcEngine();
      await rtcEngine.initialize(RtcEngineContext(
        appId: engineAppId,
        areaCode: AreaCode.areaCodeGlob.value(),
      ));

      final mediaRecorder = (await rtcEngine.createMediaRecorder(
          RecorderStreamInfo(channelId: 'hello', uid: 0)))!;

      try {
        await mediaRecorder.stopRecording();
      } catch (e) {
        if (e is! AgoraRtcException) {
          debugPrint('[stopRecording] error: ${e.toString()}');
          rethrow;
        }

        if (e.code != -4) {
          // Only not supported error supported.
          rethrow;
        }
      }

      await rtcEngine.destroyMediaRecorder(mediaRecorder);
      await rtcEngine.release();
    },
//  skip: !(),
  );
}
