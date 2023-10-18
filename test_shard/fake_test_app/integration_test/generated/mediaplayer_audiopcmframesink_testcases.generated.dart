/// GENERATED BY testcase_gen. DO NOT MODIFY BY HAND.

// ignore_for_file: deprecated_member_use,constant_identifier_names

import 'dart:async';
import 'dart:typed_data';

import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:iris_tester/iris_tester.dart';
import 'package:iris_method_channel/iris_method_channel.dart';

void generatedTestCases(IrisTester irisTester) {
  testWidgets(
    'onFrame',
    (WidgetTester tester) async {
      RtcEngine rtcEngine = createAgoraRtcEngine();
      await rtcEngine.initialize(RtcEngineContext(
        appId: 'app_id',
        areaCode: AreaCode.areaCodeGlob.value(),
      ));
      MediaPlayerController mediaPlayerController = MediaPlayerController(
          rtcEngine: rtcEngine, canvas: const VideoCanvas());
      await mediaPlayerController.initialize();

      final onFrameCompleter = Completer<bool>();
      final theAudioPcmFrameSink = AudioPcmFrameSink(
        onFrame: (AudioPcmFrame frame) {
          onFrameCompleter.complete(true);
        },
      );

      const RawAudioFrameOpModeType mode =
          RawAudioFrameOpModeType.rawAudioFrameOpModeReadOnly;

      mediaPlayerController.registerAudioFrameObserver(
        observer: theAudioPcmFrameSink,
        mode: mode,
      );

// Delay 500 milliseconds to ensure the registerAudioFrameObserver call completed.
      await Future.delayed(const Duration(milliseconds: 500));

      {
        const BytesPerSample frameBytesPerSample =
            BytesPerSample.twoBytesPerSample;
        const int frameCaptureTimestamp = 10;
        const int frameSamplesPerChannel = 10;
        const int frameSampleRateHz = 10;
        const int frameNumChannels = 10;
        const List<int> frameData = [];
        const AudioPcmFrame frame = AudioPcmFrame(
          captureTimestamp: frameCaptureTimestamp,
          samplesPerChannel: frameSamplesPerChannel,
          sampleRateHz: frameSampleRateHz,
          numChannels: frameNumChannels,
          bytesPerSample: frameBytesPerSample,
          data: frameData,
        );

        final eventJson = {
          'frame': frame.toJson(),
        };

        if (!kIsWeb) {
          irisTester.fireEvent('AudioPcmFrameSink_onFrame', params: eventJson);
        } else {
          final ret = irisTester.fireEvent('AudioPcmFrameSink_onFrame',
              params: eventJson);
// Delay 200 milliseconds to ensure the callback is called.
          await Future.delayed(const Duration(milliseconds: 200));
// TODO(littlegnal): Most of callbacks on web are not implemented, we're temporarily skip these callbacks at this time.
          if (ret) {
            if (!onFrameCompleter.isCompleted) {
              onFrameCompleter.complete(true);
            }
          }
        }
      }

      final eventCalled = await onFrameCompleter.future;
      expect(eventCalled, isTrue);

      {
        mediaPlayerController.unregisterAudioFrameObserver(
          theAudioPcmFrameSink,
        );
      }
// Delay 500 milliseconds to ensure the unregisterAudioFrameObserver call completed.
      await Future.delayed(const Duration(milliseconds: 500));

      await rtcEngine.release();
    },
    timeout: const Timeout(Duration(minutes: 2)),
  );
}

