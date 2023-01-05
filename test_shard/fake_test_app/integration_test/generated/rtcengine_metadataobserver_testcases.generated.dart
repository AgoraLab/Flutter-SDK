/// GENERATED BY testcase_gen. DO NOT MODIFY BY HAND.

// ignore_for_file: deprecated_member_use,constant_identifier_names

import 'dart:async';
import 'dart:typed_data';

import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:iris_tester/iris_tester.dart';
import 'package:agora_rtc_engine/src/impl/api_caller.dart';

void generatedTestCases() {
  testWidgets(
    'onMetadataReceived',
    (WidgetTester tester) async {
      final irisTester = IrisTester();
      final debugApiEngineIntPtr = irisTester.getDebugApiEngineNativeHandle();
      setMockIrisApiEngineIntPtr(debugApiEngineIntPtr);

      RtcEngine rtcEngine = createAgoraRtcEngine();
      await rtcEngine.initialize(RtcEngineContext(
        appId: 'app_id',
        areaCode: AreaCode.areaCodeGlob.value(),
      ));

      final onMetadataReceivedCompleter = Completer<bool>();
      final theMetadataObserver = MetadataObserver(
        onMetadataReceived: (Metadata metadata) {
          onMetadataReceivedCompleter.complete(true);
        },
      );

      const MetadataType type = MetadataType.unknownMetadata;

      rtcEngine.registerMediaMetadataObserver(
        observer: theMetadataObserver,
        type: type,
      );

// Delay 500 milliseconds to ensure the registerMediaMetadataObserver call completed.
      await Future.delayed(const Duration(milliseconds: 500));

      {
        const int metadataUid = 10;
        const int metadataSize = 10;
        Uint8List metadataBuffer = Uint8List.fromList([1, 2, 3, 4, 5]);
        const int metadataTimeStampMs = 10;
        final Metadata metadata = Metadata(
          uid: metadataUid,
          size: metadataSize,
          buffer: metadataBuffer,
          timeStampMs: metadataTimeStampMs,
        );

        final eventJson = {
          'metadata': metadata.toJson(),
        };

        irisTester.fireEvent('MetadataObserver_onMetadataReceived',
            params: eventJson);
      }

      final eventCalled = await onMetadataReceivedCompleter.future;
      expect(eventCalled, isTrue);

      {
        const MetadataType type = MetadataType.unknownMetadata;

        rtcEngine.unregisterMediaMetadataObserver(
          observer: theMetadataObserver,
          type: type,
        );
      }
// Delay 500 milliseconds to ensure the unregisterMediaMetadataObserver call completed.
      await Future.delayed(const Duration(milliseconds: 500));

      await rtcEngine.release();
    },
  );
}

