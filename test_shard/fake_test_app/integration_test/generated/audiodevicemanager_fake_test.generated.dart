/// GENERATED BY testcase_gen. DO NOT MODIFY BY HAND.

// ignore_for_file: deprecated_member_use,constant_identifier_names

import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/foundation.dart';
import 'package:fake_test_app/main.dart' as app;
import 'package:iris_tester/iris_tester.dart';
import 'package:iris_method_channel/iris_method_channel.dart';

void audioDeviceManagerSmokeTestCases() {
  testWidgets(
    'enumeratePlaybackDevices',
    (WidgetTester tester) async {
      String engineAppId = const String.fromEnvironment('TEST_APP_ID',
          defaultValue: '<YOUR_APP_ID>');

      RtcEngine rtcEngine = createAgoraRtcEngine();
      await rtcEngine.initialize(RtcEngineContext(
        appId: engineAppId,
        areaCode: AreaCode.areaCodeGlob.value(),
      ));

      final audioDeviceManager = rtcEngine.getAudioDeviceManager();

      try {
        await audioDeviceManager.enumeratePlaybackDevices();
      } catch (e) {
        if (e is! AgoraRtcException) {
          debugPrint('[enumeratePlaybackDevices] error: ${e.toString()}');
          rethrow;
        }

        if (e.code != -4) {
          // Only not supported error supported.
          rethrow;
        }
      }

      await audioDeviceManager.release();
      await rtcEngine.release();
    },
  );

  testWidgets(
    'enumerateRecordingDevices',
    (WidgetTester tester) async {
      String engineAppId = const String.fromEnvironment('TEST_APP_ID',
          defaultValue: '<YOUR_APP_ID>');

      RtcEngine rtcEngine = createAgoraRtcEngine();
      await rtcEngine.initialize(RtcEngineContext(
        appId: engineAppId,
        areaCode: AreaCode.areaCodeGlob.value(),
      ));

      final audioDeviceManager = rtcEngine.getAudioDeviceManager();

      try {
        await audioDeviceManager.enumerateRecordingDevices();
      } catch (e) {
        if (e is! AgoraRtcException) {
          debugPrint('[enumerateRecordingDevices] error: ${e.toString()}');
          rethrow;
        }

        if (e.code != -4) {
          // Only not supported error supported.
          rethrow;
        }
      }

      await audioDeviceManager.release();
      await rtcEngine.release();
    },
  );

  testWidgets(
    'setPlaybackDevice',
    (WidgetTester tester) async {
      String engineAppId = const String.fromEnvironment('TEST_APP_ID',
          defaultValue: '<YOUR_APP_ID>');

      RtcEngine rtcEngine = createAgoraRtcEngine();
      await rtcEngine.initialize(RtcEngineContext(
        appId: engineAppId,
        areaCode: AreaCode.areaCodeGlob.value(),
      ));

      final audioDeviceManager = rtcEngine.getAudioDeviceManager();

      try {
        const String deviceId = "hello";
        await audioDeviceManager.setPlaybackDevice(
          deviceId,
        );
      } catch (e) {
        if (e is! AgoraRtcException) {
          debugPrint('[setPlaybackDevice] error: ${e.toString()}');
          rethrow;
        }

        if (e.code != -4) {
          // Only not supported error supported.
          rethrow;
        }
      }

      await audioDeviceManager.release();
      await rtcEngine.release();
    },
  );

  testWidgets(
    'getPlaybackDevice',
    (WidgetTester tester) async {
      String engineAppId = const String.fromEnvironment('TEST_APP_ID',
          defaultValue: '<YOUR_APP_ID>');

      RtcEngine rtcEngine = createAgoraRtcEngine();
      await rtcEngine.initialize(RtcEngineContext(
        appId: engineAppId,
        areaCode: AreaCode.areaCodeGlob.value(),
      ));

      final audioDeviceManager = rtcEngine.getAudioDeviceManager();

      try {
        await audioDeviceManager.getPlaybackDevice();
      } catch (e) {
        if (e is! AgoraRtcException) {
          debugPrint('[getPlaybackDevice] error: ${e.toString()}');
          rethrow;
        }

        if (e.code != -4) {
          // Only not supported error supported.
          rethrow;
        }
      }

      await audioDeviceManager.release();
      await rtcEngine.release();
    },
  );

  testWidgets(
    'getPlaybackDeviceInfo',
    (WidgetTester tester) async {
      String engineAppId = const String.fromEnvironment('TEST_APP_ID',
          defaultValue: '<YOUR_APP_ID>');

      RtcEngine rtcEngine = createAgoraRtcEngine();
      await rtcEngine.initialize(RtcEngineContext(
        appId: engineAppId,
        areaCode: AreaCode.areaCodeGlob.value(),
      ));

      final audioDeviceManager = rtcEngine.getAudioDeviceManager();

      try {
        await audioDeviceManager.getPlaybackDeviceInfo();
      } catch (e) {
        if (e is! AgoraRtcException) {
          debugPrint('[getPlaybackDeviceInfo] error: ${e.toString()}');
          rethrow;
        }

        if (e.code != -4) {
          // Only not supported error supported.
          rethrow;
        }
      }

      await audioDeviceManager.release();
      await rtcEngine.release();
    },
  );

  testWidgets(
    'setPlaybackDeviceVolume',
    (WidgetTester tester) async {
      String engineAppId = const String.fromEnvironment('TEST_APP_ID',
          defaultValue: '<YOUR_APP_ID>');

      RtcEngine rtcEngine = createAgoraRtcEngine();
      await rtcEngine.initialize(RtcEngineContext(
        appId: engineAppId,
        areaCode: AreaCode.areaCodeGlob.value(),
      ));

      final audioDeviceManager = rtcEngine.getAudioDeviceManager();

      try {
        const int volume = 10;
        await audioDeviceManager.setPlaybackDeviceVolume(
          volume,
        );
      } catch (e) {
        if (e is! AgoraRtcException) {
          debugPrint('[setPlaybackDeviceVolume] error: ${e.toString()}');
          rethrow;
        }

        if (e.code != -4) {
          // Only not supported error supported.
          rethrow;
        }
      }

      await audioDeviceManager.release();
      await rtcEngine.release();
    },
  );

  testWidgets(
    'getPlaybackDeviceVolume',
    (WidgetTester tester) async {
      String engineAppId = const String.fromEnvironment('TEST_APP_ID',
          defaultValue: '<YOUR_APP_ID>');

      RtcEngine rtcEngine = createAgoraRtcEngine();
      await rtcEngine.initialize(RtcEngineContext(
        appId: engineAppId,
        areaCode: AreaCode.areaCodeGlob.value(),
      ));

      final audioDeviceManager = rtcEngine.getAudioDeviceManager();

      try {
        await audioDeviceManager.getPlaybackDeviceVolume();
      } catch (e) {
        if (e is! AgoraRtcException) {
          debugPrint('[getPlaybackDeviceVolume] error: ${e.toString()}');
          rethrow;
        }

        if (e.code != -4) {
          // Only not supported error supported.
          rethrow;
        }
      }

      await audioDeviceManager.release();
      await rtcEngine.release();
    },
  );

  testWidgets(
    'setRecordingDevice',
    (WidgetTester tester) async {
      String engineAppId = const String.fromEnvironment('TEST_APP_ID',
          defaultValue: '<YOUR_APP_ID>');

      RtcEngine rtcEngine = createAgoraRtcEngine();
      await rtcEngine.initialize(RtcEngineContext(
        appId: engineAppId,
        areaCode: AreaCode.areaCodeGlob.value(),
      ));

      final audioDeviceManager = rtcEngine.getAudioDeviceManager();

      try {
        const String deviceId = "hello";
        await audioDeviceManager.setRecordingDevice(
          deviceId,
        );
      } catch (e) {
        if (e is! AgoraRtcException) {
          debugPrint('[setRecordingDevice] error: ${e.toString()}');
          rethrow;
        }

        if (e.code != -4) {
          // Only not supported error supported.
          rethrow;
        }
      }

      await audioDeviceManager.release();
      await rtcEngine.release();
    },
  );

  testWidgets(
    'getRecordingDevice',
    (WidgetTester tester) async {
      String engineAppId = const String.fromEnvironment('TEST_APP_ID',
          defaultValue: '<YOUR_APP_ID>');

      RtcEngine rtcEngine = createAgoraRtcEngine();
      await rtcEngine.initialize(RtcEngineContext(
        appId: engineAppId,
        areaCode: AreaCode.areaCodeGlob.value(),
      ));

      final audioDeviceManager = rtcEngine.getAudioDeviceManager();

      try {
        await audioDeviceManager.getRecordingDevice();
      } catch (e) {
        if (e is! AgoraRtcException) {
          debugPrint('[getRecordingDevice] error: ${e.toString()}');
          rethrow;
        }

        if (e.code != -4) {
          // Only not supported error supported.
          rethrow;
        }
      }

      await audioDeviceManager.release();
      await rtcEngine.release();
    },
  );

  testWidgets(
    'getRecordingDeviceInfo',
    (WidgetTester tester) async {
      String engineAppId = const String.fromEnvironment('TEST_APP_ID',
          defaultValue: '<YOUR_APP_ID>');

      RtcEngine rtcEngine = createAgoraRtcEngine();
      await rtcEngine.initialize(RtcEngineContext(
        appId: engineAppId,
        areaCode: AreaCode.areaCodeGlob.value(),
      ));

      final audioDeviceManager = rtcEngine.getAudioDeviceManager();

      try {
        await audioDeviceManager.getRecordingDeviceInfo();
      } catch (e) {
        if (e is! AgoraRtcException) {
          debugPrint('[getRecordingDeviceInfo] error: ${e.toString()}');
          rethrow;
        }

        if (e.code != -4) {
          // Only not supported error supported.
          rethrow;
        }
      }

      await audioDeviceManager.release();
      await rtcEngine.release();
    },
  );

  testWidgets(
    'setRecordingDeviceVolume',
    (WidgetTester tester) async {
      String engineAppId = const String.fromEnvironment('TEST_APP_ID',
          defaultValue: '<YOUR_APP_ID>');

      RtcEngine rtcEngine = createAgoraRtcEngine();
      await rtcEngine.initialize(RtcEngineContext(
        appId: engineAppId,
        areaCode: AreaCode.areaCodeGlob.value(),
      ));

      final audioDeviceManager = rtcEngine.getAudioDeviceManager();

      try {
        const int volume = 10;
        await audioDeviceManager.setRecordingDeviceVolume(
          volume,
        );
      } catch (e) {
        if (e is! AgoraRtcException) {
          debugPrint('[setRecordingDeviceVolume] error: ${e.toString()}');
          rethrow;
        }

        if (e.code != -4) {
          // Only not supported error supported.
          rethrow;
        }
      }

      await audioDeviceManager.release();
      await rtcEngine.release();
    },
  );

  testWidgets(
    'getRecordingDeviceVolume',
    (WidgetTester tester) async {
      String engineAppId = const String.fromEnvironment('TEST_APP_ID',
          defaultValue: '<YOUR_APP_ID>');

      RtcEngine rtcEngine = createAgoraRtcEngine();
      await rtcEngine.initialize(RtcEngineContext(
        appId: engineAppId,
        areaCode: AreaCode.areaCodeGlob.value(),
      ));

      final audioDeviceManager = rtcEngine.getAudioDeviceManager();

      try {
        await audioDeviceManager.getRecordingDeviceVolume();
      } catch (e) {
        if (e is! AgoraRtcException) {
          debugPrint('[getRecordingDeviceVolume] error: ${e.toString()}');
          rethrow;
        }

        if (e.code != -4) {
          // Only not supported error supported.
          rethrow;
        }
      }

      await audioDeviceManager.release();
      await rtcEngine.release();
    },
  );

  testWidgets(
    'setLoopbackDevice',
    (WidgetTester tester) async {
      String engineAppId = const String.fromEnvironment('TEST_APP_ID',
          defaultValue: '<YOUR_APP_ID>');

      RtcEngine rtcEngine = createAgoraRtcEngine();
      await rtcEngine.initialize(RtcEngineContext(
        appId: engineAppId,
        areaCode: AreaCode.areaCodeGlob.value(),
      ));

      final audioDeviceManager = rtcEngine.getAudioDeviceManager();

      try {
        const String deviceId = "hello";
        await audioDeviceManager.setLoopbackDevice(
          deviceId,
        );
      } catch (e) {
        if (e is! AgoraRtcException) {
          debugPrint('[setLoopbackDevice] error: ${e.toString()}');
          rethrow;
        }

        if (e.code != -4) {
          // Only not supported error supported.
          rethrow;
        }
      }

      await audioDeviceManager.release();
      await rtcEngine.release();
    },
  );

  testWidgets(
    'getLoopbackDevice',
    (WidgetTester tester) async {
      String engineAppId = const String.fromEnvironment('TEST_APP_ID',
          defaultValue: '<YOUR_APP_ID>');

      RtcEngine rtcEngine = createAgoraRtcEngine();
      await rtcEngine.initialize(RtcEngineContext(
        appId: engineAppId,
        areaCode: AreaCode.areaCodeGlob.value(),
      ));

      final audioDeviceManager = rtcEngine.getAudioDeviceManager();

      try {
        await audioDeviceManager.getLoopbackDevice();
      } catch (e) {
        if (e is! AgoraRtcException) {
          debugPrint('[getLoopbackDevice] error: ${e.toString()}');
          rethrow;
        }

        if (e.code != -4) {
          // Only not supported error supported.
          rethrow;
        }
      }

      await audioDeviceManager.release();
      await rtcEngine.release();
    },
  );

  testWidgets(
    'setPlaybackDeviceMute',
    (WidgetTester tester) async {
      String engineAppId = const String.fromEnvironment('TEST_APP_ID',
          defaultValue: '<YOUR_APP_ID>');

      RtcEngine rtcEngine = createAgoraRtcEngine();
      await rtcEngine.initialize(RtcEngineContext(
        appId: engineAppId,
        areaCode: AreaCode.areaCodeGlob.value(),
      ));

      final audioDeviceManager = rtcEngine.getAudioDeviceManager();

      try {
        const bool mute = true;
        await audioDeviceManager.setPlaybackDeviceMute(
          mute,
        );
      } catch (e) {
        if (e is! AgoraRtcException) {
          debugPrint('[setPlaybackDeviceMute] error: ${e.toString()}');
          rethrow;
        }

        if (e.code != -4) {
          // Only not supported error supported.
          rethrow;
        }
      }

      await audioDeviceManager.release();
      await rtcEngine.release();
    },
  );

  testWidgets(
    'getPlaybackDeviceMute',
    (WidgetTester tester) async {
      String engineAppId = const String.fromEnvironment('TEST_APP_ID',
          defaultValue: '<YOUR_APP_ID>');

      RtcEngine rtcEngine = createAgoraRtcEngine();
      await rtcEngine.initialize(RtcEngineContext(
        appId: engineAppId,
        areaCode: AreaCode.areaCodeGlob.value(),
      ));

      final audioDeviceManager = rtcEngine.getAudioDeviceManager();

      try {
        await audioDeviceManager.getPlaybackDeviceMute();
      } catch (e) {
        if (e is! AgoraRtcException) {
          debugPrint('[getPlaybackDeviceMute] error: ${e.toString()}');
          rethrow;
        }

        if (e.code != -4) {
          // Only not supported error supported.
          rethrow;
        }
      }

      await audioDeviceManager.release();
      await rtcEngine.release();
    },
  );

  testWidgets(
    'setRecordingDeviceMute',
    (WidgetTester tester) async {
      String engineAppId = const String.fromEnvironment('TEST_APP_ID',
          defaultValue: '<YOUR_APP_ID>');

      RtcEngine rtcEngine = createAgoraRtcEngine();
      await rtcEngine.initialize(RtcEngineContext(
        appId: engineAppId,
        areaCode: AreaCode.areaCodeGlob.value(),
      ));

      final audioDeviceManager = rtcEngine.getAudioDeviceManager();

      try {
        const bool mute = true;
        await audioDeviceManager.setRecordingDeviceMute(
          mute,
        );
      } catch (e) {
        if (e is! AgoraRtcException) {
          debugPrint('[setRecordingDeviceMute] error: ${e.toString()}');
          rethrow;
        }

        if (e.code != -4) {
          // Only not supported error supported.
          rethrow;
        }
      }

      await audioDeviceManager.release();
      await rtcEngine.release();
    },
  );

  testWidgets(
    'getRecordingDeviceMute',
    (WidgetTester tester) async {
      String engineAppId = const String.fromEnvironment('TEST_APP_ID',
          defaultValue: '<YOUR_APP_ID>');

      RtcEngine rtcEngine = createAgoraRtcEngine();
      await rtcEngine.initialize(RtcEngineContext(
        appId: engineAppId,
        areaCode: AreaCode.areaCodeGlob.value(),
      ));

      final audioDeviceManager = rtcEngine.getAudioDeviceManager();

      try {
        await audioDeviceManager.getRecordingDeviceMute();
      } catch (e) {
        if (e is! AgoraRtcException) {
          debugPrint('[getRecordingDeviceMute] error: ${e.toString()}');
          rethrow;
        }

        if (e.code != -4) {
          // Only not supported error supported.
          rethrow;
        }
      }

      await audioDeviceManager.release();
      await rtcEngine.release();
    },
  );

  testWidgets(
    'startPlaybackDeviceTest',
    (WidgetTester tester) async {
      String engineAppId = const String.fromEnvironment('TEST_APP_ID',
          defaultValue: '<YOUR_APP_ID>');

      RtcEngine rtcEngine = createAgoraRtcEngine();
      await rtcEngine.initialize(RtcEngineContext(
        appId: engineAppId,
        areaCode: AreaCode.areaCodeGlob.value(),
      ));

      final audioDeviceManager = rtcEngine.getAudioDeviceManager();

      try {
        const String testAudioFilePath = "hello";
        await audioDeviceManager.startPlaybackDeviceTest(
          testAudioFilePath,
        );
      } catch (e) {
        if (e is! AgoraRtcException) {
          debugPrint('[startPlaybackDeviceTest] error: ${e.toString()}');
          rethrow;
        }

        if (e.code != -4) {
          // Only not supported error supported.
          rethrow;
        }
      }

      await audioDeviceManager.release();
      await rtcEngine.release();
    },
  );

  testWidgets(
    'stopPlaybackDeviceTest',
    (WidgetTester tester) async {
      String engineAppId = const String.fromEnvironment('TEST_APP_ID',
          defaultValue: '<YOUR_APP_ID>');

      RtcEngine rtcEngine = createAgoraRtcEngine();
      await rtcEngine.initialize(RtcEngineContext(
        appId: engineAppId,
        areaCode: AreaCode.areaCodeGlob.value(),
      ));

      final audioDeviceManager = rtcEngine.getAudioDeviceManager();

      try {
        await audioDeviceManager.stopPlaybackDeviceTest();
      } catch (e) {
        if (e is! AgoraRtcException) {
          debugPrint('[stopPlaybackDeviceTest] error: ${e.toString()}');
          rethrow;
        }

        if (e.code != -4) {
          // Only not supported error supported.
          rethrow;
        }
      }

      await audioDeviceManager.release();
      await rtcEngine.release();
    },
  );

  testWidgets(
    'startRecordingDeviceTest',
    (WidgetTester tester) async {
      String engineAppId = const String.fromEnvironment('TEST_APP_ID',
          defaultValue: '<YOUR_APP_ID>');

      RtcEngine rtcEngine = createAgoraRtcEngine();
      await rtcEngine.initialize(RtcEngineContext(
        appId: engineAppId,
        areaCode: AreaCode.areaCodeGlob.value(),
      ));

      final audioDeviceManager = rtcEngine.getAudioDeviceManager();

      try {
        const int indicationInterval = 10;
        await audioDeviceManager.startRecordingDeviceTest(
          indicationInterval,
        );
      } catch (e) {
        if (e is! AgoraRtcException) {
          debugPrint('[startRecordingDeviceTest] error: ${e.toString()}');
          rethrow;
        }

        if (e.code != -4) {
          // Only not supported error supported.
          rethrow;
        }
      }

      await audioDeviceManager.release();
      await rtcEngine.release();
    },
  );

  testWidgets(
    'stopRecordingDeviceTest',
    (WidgetTester tester) async {
      String engineAppId = const String.fromEnvironment('TEST_APP_ID',
          defaultValue: '<YOUR_APP_ID>');

      RtcEngine rtcEngine = createAgoraRtcEngine();
      await rtcEngine.initialize(RtcEngineContext(
        appId: engineAppId,
        areaCode: AreaCode.areaCodeGlob.value(),
      ));

      final audioDeviceManager = rtcEngine.getAudioDeviceManager();

      try {
        await audioDeviceManager.stopRecordingDeviceTest();
      } catch (e) {
        if (e is! AgoraRtcException) {
          debugPrint('[stopRecordingDeviceTest] error: ${e.toString()}');
          rethrow;
        }

        if (e.code != -4) {
          // Only not supported error supported.
          rethrow;
        }
      }

      await audioDeviceManager.release();
      await rtcEngine.release();
    },
  );

  testWidgets(
    'startAudioDeviceLoopbackTest',
    (WidgetTester tester) async {
      String engineAppId = const String.fromEnvironment('TEST_APP_ID',
          defaultValue: '<YOUR_APP_ID>');

      RtcEngine rtcEngine = createAgoraRtcEngine();
      await rtcEngine.initialize(RtcEngineContext(
        appId: engineAppId,
        areaCode: AreaCode.areaCodeGlob.value(),
      ));

      final audioDeviceManager = rtcEngine.getAudioDeviceManager();

      try {
        const int indicationInterval = 10;
        await audioDeviceManager.startAudioDeviceLoopbackTest(
          indicationInterval,
        );
      } catch (e) {
        if (e is! AgoraRtcException) {
          debugPrint('[startAudioDeviceLoopbackTest] error: ${e.toString()}');
          rethrow;
        }

        if (e.code != -4) {
          // Only not supported error supported.
          rethrow;
        }
      }

      await audioDeviceManager.release();
      await rtcEngine.release();
    },
  );

  testWidgets(
    'stopAudioDeviceLoopbackTest',
    (WidgetTester tester) async {
      String engineAppId = const String.fromEnvironment('TEST_APP_ID',
          defaultValue: '<YOUR_APP_ID>');

      RtcEngine rtcEngine = createAgoraRtcEngine();
      await rtcEngine.initialize(RtcEngineContext(
        appId: engineAppId,
        areaCode: AreaCode.areaCodeGlob.value(),
      ));

      final audioDeviceManager = rtcEngine.getAudioDeviceManager();

      try {
        await audioDeviceManager.stopAudioDeviceLoopbackTest();
      } catch (e) {
        if (e is! AgoraRtcException) {
          debugPrint('[stopAudioDeviceLoopbackTest] error: ${e.toString()}');
          rethrow;
        }

        if (e.code != -4) {
          // Only not supported error supported.
          rethrow;
        }
      }

      await audioDeviceManager.release();
      await rtcEngine.release();
    },
  );

  testWidgets(
    'followSystemPlaybackDevice',
    (WidgetTester tester) async {
      String engineAppId = const String.fromEnvironment('TEST_APP_ID',
          defaultValue: '<YOUR_APP_ID>');

      RtcEngine rtcEngine = createAgoraRtcEngine();
      await rtcEngine.initialize(RtcEngineContext(
        appId: engineAppId,
        areaCode: AreaCode.areaCodeGlob.value(),
      ));

      final audioDeviceManager = rtcEngine.getAudioDeviceManager();

      try {
        const bool enable = true;
        await audioDeviceManager.followSystemPlaybackDevice(
          enable,
        );
      } catch (e) {
        if (e is! AgoraRtcException) {
          debugPrint('[followSystemPlaybackDevice] error: ${e.toString()}');
          rethrow;
        }

        if (e.code != -4) {
          // Only not supported error supported.
          rethrow;
        }
      }

      await audioDeviceManager.release();
      await rtcEngine.release();
    },
  );

  testWidgets(
    'followSystemRecordingDevice',
    (WidgetTester tester) async {
      String engineAppId = const String.fromEnvironment('TEST_APP_ID',
          defaultValue: '<YOUR_APP_ID>');

      RtcEngine rtcEngine = createAgoraRtcEngine();
      await rtcEngine.initialize(RtcEngineContext(
        appId: engineAppId,
        areaCode: AreaCode.areaCodeGlob.value(),
      ));

      final audioDeviceManager = rtcEngine.getAudioDeviceManager();

      try {
        const bool enable = true;
        await audioDeviceManager.followSystemRecordingDevice(
          enable,
        );
      } catch (e) {
        if (e is! AgoraRtcException) {
          debugPrint('[followSystemRecordingDevice] error: ${e.toString()}');
          rethrow;
        }

        if (e.code != -4) {
          // Only not supported error supported.
          rethrow;
        }
      }

      await audioDeviceManager.release();
      await rtcEngine.release();
    },
  );

  testWidgets(
    'followSystemLoopbackDevice',
    (WidgetTester tester) async {
      String engineAppId = const String.fromEnvironment('TEST_APP_ID',
          defaultValue: '<YOUR_APP_ID>');

      RtcEngine rtcEngine = createAgoraRtcEngine();
      await rtcEngine.initialize(RtcEngineContext(
        appId: engineAppId,
        areaCode: AreaCode.areaCodeGlob.value(),
      ));

      final audioDeviceManager = rtcEngine.getAudioDeviceManager();

      try {
        const bool enable = true;
        await audioDeviceManager.followSystemLoopbackDevice(
          enable,
        );
      } catch (e) {
        if (e is! AgoraRtcException) {
          debugPrint('[followSystemLoopbackDevice] error: ${e.toString()}');
          rethrow;
        }

        if (e.code != -4) {
          // Only not supported error supported.
          rethrow;
        }
      }

      await audioDeviceManager.release();
      await rtcEngine.release();
    },
  );

  testWidgets(
    'release',
    (WidgetTester tester) async {
      String engineAppId = const String.fromEnvironment('TEST_APP_ID',
          defaultValue: '<YOUR_APP_ID>');

      RtcEngine rtcEngine = createAgoraRtcEngine();
      await rtcEngine.initialize(RtcEngineContext(
        appId: engineAppId,
        areaCode: AreaCode.areaCodeGlob.value(),
      ));

      final audioDeviceManager = rtcEngine.getAudioDeviceManager();

      try {
        await audioDeviceManager.release();
      } catch (e) {
        if (e is! AgoraRtcException) {
          debugPrint('[release] error: ${e.toString()}');
          rethrow;
        }

        if (e.code != -4) {
          // Only not supported error supported.
          rethrow;
        }
      }

      await audioDeviceManager.release();
      await rtcEngine.release();
    },
  );

  testWidgets(
    'getPlaybackDefaultDevice',
    (WidgetTester tester) async {
      String engineAppId = const String.fromEnvironment('TEST_APP_ID',
          defaultValue: '<YOUR_APP_ID>');

      RtcEngine rtcEngine = createAgoraRtcEngine();
      await rtcEngine.initialize(RtcEngineContext(
        appId: engineAppId,
        areaCode: AreaCode.areaCodeGlob.value(),
      ));

      final audioDeviceManager = rtcEngine.getAudioDeviceManager();

      try {
        await audioDeviceManager.getPlaybackDefaultDevice();
      } catch (e) {
        if (e is! AgoraRtcException) {
          debugPrint('[getPlaybackDefaultDevice] error: ${e.toString()}');
          rethrow;
        }

        if (e.code != -4) {
          // Only not supported error supported.
          rethrow;
        }
      }

      await audioDeviceManager.release();
      await rtcEngine.release();
    },
  );

  testWidgets(
    'getRecordingDefaultDevice',
    (WidgetTester tester) async {
      String engineAppId = const String.fromEnvironment('TEST_APP_ID',
          defaultValue: '<YOUR_APP_ID>');

      RtcEngine rtcEngine = createAgoraRtcEngine();
      await rtcEngine.initialize(RtcEngineContext(
        appId: engineAppId,
        areaCode: AreaCode.areaCodeGlob.value(),
      ));

      final audioDeviceManager = rtcEngine.getAudioDeviceManager();

      try {
        await audioDeviceManager.getRecordingDefaultDevice();
      } catch (e) {
        if (e is! AgoraRtcException) {
          debugPrint('[getRecordingDefaultDevice] error: ${e.toString()}');
          rethrow;
        }

        if (e.code != -4) {
          // Only not supported error supported.
          rethrow;
        }
      }

      await audioDeviceManager.release();
      await rtcEngine.release();
    },
  );
}
