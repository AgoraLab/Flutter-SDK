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
    'onMusicChartsResult',
    (WidgetTester tester) async {
      final irisTester = IrisTester();
      final debugApiEngineIntPtr = irisTester.getDebugApiEngineNativeHandle();
      setMockIrisApiEngineIntPtr(debugApiEngineIntPtr);

      RtcEngine rtcEngine = createAgoraRtcEngine();
      await rtcEngine.initialize(RtcEngineContext(
        appId: 'app_id',
        areaCode: AreaCode.areaCodeGlob.value(),
      ));

      final musicContentCenter = rtcEngine.getMusicContentCenter();
      const musicContentCenterConfiguration = MusicContentCenterConfiguration(
          appId: 'app_id', token: 'token', mccUid: 10);
      await musicContentCenter.initialize(musicContentCenterConfiguration);

      final onMusicChartsResultCompleter = Completer<bool>();
      final theMusicContentCenterEventHandler = MusicContentCenterEventHandler(
        onMusicChartsResult: (String requestId,
            MusicContentCenterStatusCode status, List result) {
          onMusicChartsResultCompleter.complete(true);
        },
      );

      musicContentCenter.registerEventHandler(
        theMusicContentCenterEventHandler,
      );

// Delay 500 milliseconds to ensure the registerEventHandler call completed.
      await Future.delayed(const Duration(milliseconds: 500));

      {
        const String requestId = "hello";
        const MusicContentCenterStatusCode status =
            MusicContentCenterStatusCode.kMusicContentCenterStatusOk;
        const List<MusicChartInfo> result = [];

        final eventJson = {
          'requestId': requestId,
          'status': status.value(),
          'result': result,
        };

        irisTester.fireEvent(
            'MusicContentCenterEventHandler_onMusicChartsResult',
            params: eventJson);
      }

      final eventCalled = await onMusicChartsResultCompleter.future;
      expect(eventCalled, isTrue);

      {
        musicContentCenter.unregisterEventHandler();
      }
// Delay 500 milliseconds to ensure the unregisterEventHandler call completed.
      await Future.delayed(const Duration(milliseconds: 500));

      await musicContentCenter.release();
      await rtcEngine.release();
    },
  );

  testWidgets(
    'onMusicCollectionResult',
    (WidgetTester tester) async {
      final irisTester = IrisTester();
      final debugApiEngineIntPtr = irisTester.getDebugApiEngineNativeHandle();
      setMockIrisApiEngineIntPtr(debugApiEngineIntPtr);

      RtcEngine rtcEngine = createAgoraRtcEngine();
      await rtcEngine.initialize(RtcEngineContext(
        appId: 'app_id',
        areaCode: AreaCode.areaCodeGlob.value(),
      ));

      final musicContentCenter = rtcEngine.getMusicContentCenter();
      const musicContentCenterConfiguration = MusicContentCenterConfiguration(
          appId: 'app_id', token: 'token', mccUid: 10);
      await musicContentCenter.initialize(musicContentCenterConfiguration);

      final onMusicCollectionResultCompleter = Completer<bool>();
      final theMusicContentCenterEventHandler = MusicContentCenterEventHandler(
        onMusicCollectionResult: (String requestId,
            MusicContentCenterStatusCode status, MusicCollection result) {
          onMusicCollectionResultCompleter.complete(true);
        },
      );

      musicContentCenter.registerEventHandler(
        theMusicContentCenterEventHandler,
      );

// Delay 500 milliseconds to ensure the registerEventHandler call completed.
      await Future.delayed(const Duration(milliseconds: 500));

      {
        const String requestId = "hello";
        const MusicContentCenterStatusCode status =
            MusicContentCenterStatusCode.kMusicContentCenterStatusOk;

        final eventJson = {
          'requestId': requestId,
          'status': status.value(),
        };

        irisTester.fireEvent(
            'MusicContentCenterEventHandler_onMusicCollectionResult',
            params: eventJson);
      }

      final eventCalled = await onMusicCollectionResultCompleter.future;
      expect(eventCalled, isTrue);

      {
        musicContentCenter.unregisterEventHandler();
      }
// Delay 500 milliseconds to ensure the unregisterEventHandler call completed.
      await Future.delayed(const Duration(milliseconds: 500));

      await musicContentCenter.release();
      await rtcEngine.release();
    },
  );

  testWidgets(
    'onLyricResult',
    (WidgetTester tester) async {
      final irisTester = IrisTester();
      final debugApiEngineIntPtr = irisTester.getDebugApiEngineNativeHandle();
      setMockIrisApiEngineIntPtr(debugApiEngineIntPtr);

      RtcEngine rtcEngine = createAgoraRtcEngine();
      await rtcEngine.initialize(RtcEngineContext(
        appId: 'app_id',
        areaCode: AreaCode.areaCodeGlob.value(),
      ));

      final musicContentCenter = rtcEngine.getMusicContentCenter();
      const musicContentCenterConfiguration = MusicContentCenterConfiguration(
          appId: 'app_id', token: 'token', mccUid: 10);
      await musicContentCenter.initialize(musicContentCenterConfiguration);

      final onLyricResultCompleter = Completer<bool>();
      final theMusicContentCenterEventHandler = MusicContentCenterEventHandler(
        onLyricResult: (String requestId, String lyricUrl) {
          onLyricResultCompleter.complete(true);
        },
      );

      musicContentCenter.registerEventHandler(
        theMusicContentCenterEventHandler,
      );

// Delay 500 milliseconds to ensure the registerEventHandler call completed.
      await Future.delayed(const Duration(milliseconds: 500));

      {
        const String requestId = "hello";
        const String lyricUrl = "hello";

        final eventJson = {
          'requestId': requestId,
          'lyricUrl': lyricUrl,
        };

        irisTester.fireEvent('MusicContentCenterEventHandler_onLyricResult',
            params: eventJson);
      }

      final eventCalled = await onLyricResultCompleter.future;
      expect(eventCalled, isTrue);

      {
        musicContentCenter.unregisterEventHandler();
      }
// Delay 500 milliseconds to ensure the unregisterEventHandler call completed.
      await Future.delayed(const Duration(milliseconds: 500));

      await musicContentCenter.release();
      await rtcEngine.release();
    },
  );

  testWidgets(
    'onPreLoadEvent',
    (WidgetTester tester) async {
      final irisTester = IrisTester();
      final debugApiEngineIntPtr = irisTester.getDebugApiEngineNativeHandle();
      setMockIrisApiEngineIntPtr(debugApiEngineIntPtr);

      RtcEngine rtcEngine = createAgoraRtcEngine();
      await rtcEngine.initialize(RtcEngineContext(
        appId: 'app_id',
        areaCode: AreaCode.areaCodeGlob.value(),
      ));

      final musicContentCenter = rtcEngine.getMusicContentCenter();
      const musicContentCenterConfiguration = MusicContentCenterConfiguration(
          appId: 'app_id', token: 'token', mccUid: 10);
      await musicContentCenter.initialize(musicContentCenterConfiguration);

      final onPreLoadEventCompleter = Completer<bool>();
      final theMusicContentCenterEventHandler = MusicContentCenterEventHandler(
        onPreLoadEvent: (int songCode, int percent, PreloadStatusCode status,
            String msg, String lyricUrl) {
          onPreLoadEventCompleter.complete(true);
        },
      );

      musicContentCenter.registerEventHandler(
        theMusicContentCenterEventHandler,
      );

// Delay 500 milliseconds to ensure the registerEventHandler call completed.
      await Future.delayed(const Duration(milliseconds: 500));

      {
        const int songCode = 10;
        const int percent = 10;
        const PreloadStatusCode status =
            PreloadStatusCode.kPreloadStatusCompleted;
        const String msg = "hello";
        const String lyricUrl = "hello";

        final eventJson = {
          'songCode': songCode,
          'percent': percent,
          'status': status.value(),
          'msg': msg,
          'lyricUrl': lyricUrl,
        };

        irisTester.fireEvent('MusicContentCenterEventHandler_onPreLoadEvent',
            params: eventJson);
      }

      final eventCalled = await onPreLoadEventCompleter.future;
      expect(eventCalled, isTrue);

      {
        musicContentCenter.unregisterEventHandler();
      }
// Delay 500 milliseconds to ensure the unregisterEventHandler call completed.
      await Future.delayed(const Duration(milliseconds: 500));

      await musicContentCenter.release();
      await rtcEngine.release();
    },
  );
}

