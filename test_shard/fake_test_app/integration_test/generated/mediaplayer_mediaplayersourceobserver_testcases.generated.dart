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
    'onPlayerSourceStateChanged',
    (WidgetTester tester) async {
      RtcEngine rtcEngine = createAgoraRtcEngine();
      await rtcEngine.initialize(RtcEngineContext(
        appId: 'app_id',
        areaCode: AreaCode.areaCodeGlob.value(),
      ));
      final mediaPlayerController = MediaPlayerController(
          rtcEngine: rtcEngine, canvas: const VideoCanvas());
      await mediaPlayerController.initialize();

      final onPlayerSourceStateChangedCompleter = Completer<bool>();
      final theMediaPlayerSourceObserver = MediaPlayerSourceObserver(
        onPlayerSourceStateChanged:
            (MediaPlayerState state, MediaPlayerError ec) {
          onPlayerSourceStateChangedCompleter.complete(true);
        },
      );

      mediaPlayerController.registerPlayerSourceObserver(
        theMediaPlayerSourceObserver,
      );

// Delay 500 milliseconds to ensure the registerPlayerSourceObserver call completed.
      await Future.delayed(const Duration(milliseconds: 500));

      {
        const MediaPlayerState state = MediaPlayerState.playerStateIdle;
        const MediaPlayerError ec = MediaPlayerError.playerErrorNone;

        final eventJson = {
          'state': state.value(),
          'ec': ec.value(),
        };

        if (!kIsWeb) {
          irisTester.fireEvent(
              'MediaPlayerSourceObserver_onPlayerSourceStateChanged',
              params: eventJson);
        } else {
          final ret = irisTester.fireEvent(
              'MediaPlayerSourceObserver_onPlayerSourceStateChanged',
              params: eventJson);
// Delay 200 milliseconds to ensure the callback is called.
          await Future.delayed(const Duration(milliseconds: 200));
// TODO(littlegnal): Most of callbacks on web are not implemented, we're temporarily skip these callbacks at this time.
          if (ret) {
            if (!onPlayerSourceStateChangedCompleter.isCompleted) {
              onPlayerSourceStateChangedCompleter.complete(true);
            }
          }
        }
      }

      final eventCalled = await onPlayerSourceStateChangedCompleter.future;
      expect(eventCalled, isTrue);

      {
        mediaPlayerController.unregisterPlayerSourceObserver(
          theMediaPlayerSourceObserver,
        );
      }
// Delay 500 milliseconds to ensure the unregisterPlayerSourceObserver call completed.
      await Future.delayed(const Duration(milliseconds: 500));

      await rtcEngine.release();
    },
    timeout: const Timeout(Duration(minutes: 2)),
  );

  testWidgets(
    'onPositionChanged',
    (WidgetTester tester) async {
      RtcEngine rtcEngine = createAgoraRtcEngine();
      await rtcEngine.initialize(RtcEngineContext(
        appId: 'app_id',
        areaCode: AreaCode.areaCodeGlob.value(),
      ));
      final mediaPlayerController = MediaPlayerController(
          rtcEngine: rtcEngine, canvas: const VideoCanvas());
      await mediaPlayerController.initialize();

      final onPositionChangedCompleter = Completer<bool>();
      final theMediaPlayerSourceObserver = MediaPlayerSourceObserver(
        onPositionChanged: (int positionMs) {
          onPositionChangedCompleter.complete(true);
        },
      );

      mediaPlayerController.registerPlayerSourceObserver(
        theMediaPlayerSourceObserver,
      );

// Delay 500 milliseconds to ensure the registerPlayerSourceObserver call completed.
      await Future.delayed(const Duration(milliseconds: 500));

      {
        const int positionMs = 10;

        final eventJson = {
          'positionMs': positionMs,
        };

        if (!kIsWeb) {
          irisTester.fireEvent('MediaPlayerSourceObserver_onPositionChanged',
              params: eventJson);
        } else {
          final ret = irisTester.fireEvent(
              'MediaPlayerSourceObserver_onPositionChanged',
              params: eventJson);
// Delay 200 milliseconds to ensure the callback is called.
          await Future.delayed(const Duration(milliseconds: 200));
// TODO(littlegnal): Most of callbacks on web are not implemented, we're temporarily skip these callbacks at this time.
          if (ret) {
            if (!onPositionChangedCompleter.isCompleted) {
              onPositionChangedCompleter.complete(true);
            }
          }
        }
      }

      final eventCalled = await onPositionChangedCompleter.future;
      expect(eventCalled, isTrue);

      {
        mediaPlayerController.unregisterPlayerSourceObserver(
          theMediaPlayerSourceObserver,
        );
      }
// Delay 500 milliseconds to ensure the unregisterPlayerSourceObserver call completed.
      await Future.delayed(const Duration(milliseconds: 500));

      await rtcEngine.release();
    },
    timeout: const Timeout(Duration(minutes: 2)),
  );

  testWidgets(
    'onPlayerEvent',
    (WidgetTester tester) async {
      RtcEngine rtcEngine = createAgoraRtcEngine();
      await rtcEngine.initialize(RtcEngineContext(
        appId: 'app_id',
        areaCode: AreaCode.areaCodeGlob.value(),
      ));
      final mediaPlayerController = MediaPlayerController(
          rtcEngine: rtcEngine, canvas: const VideoCanvas());
      await mediaPlayerController.initialize();

      final onPlayerEventCompleter = Completer<bool>();
      final theMediaPlayerSourceObserver = MediaPlayerSourceObserver(
        onPlayerEvent:
            (MediaPlayerEvent eventCode, int elapsedTime, String message) {
          onPlayerEventCompleter.complete(true);
        },
      );

      mediaPlayerController.registerPlayerSourceObserver(
        theMediaPlayerSourceObserver,
      );

// Delay 500 milliseconds to ensure the registerPlayerSourceObserver call completed.
      await Future.delayed(const Duration(milliseconds: 500));

      {
        const MediaPlayerEvent eventCode =
            MediaPlayerEvent.playerEventSeekBegin;
        const int elapsedTime = 10;
        const String message = "hello";

        final eventJson = {
          'eventCode': eventCode.value(),
          'elapsedTime': elapsedTime,
          'message': message,
        };

        if (!kIsWeb) {
          irisTester.fireEvent('MediaPlayerSourceObserver_onPlayerEvent',
              params: eventJson);
        } else {
          final ret = irisTester.fireEvent(
              'MediaPlayerSourceObserver_onPlayerEvent',
              params: eventJson);
// Delay 200 milliseconds to ensure the callback is called.
          await Future.delayed(const Duration(milliseconds: 200));
// TODO(littlegnal): Most of callbacks on web are not implemented, we're temporarily skip these callbacks at this time.
          if (ret) {
            if (!onPlayerEventCompleter.isCompleted) {
              onPlayerEventCompleter.complete(true);
            }
          }
        }
      }

      final eventCalled = await onPlayerEventCompleter.future;
      expect(eventCalled, isTrue);

      {
        mediaPlayerController.unregisterPlayerSourceObserver(
          theMediaPlayerSourceObserver,
        );
      }
// Delay 500 milliseconds to ensure the unregisterPlayerSourceObserver call completed.
      await Future.delayed(const Duration(milliseconds: 500));

      await rtcEngine.release();
    },
    timeout: const Timeout(Duration(minutes: 2)),
  );

  testWidgets(
    'onMetaData',
    (WidgetTester tester) async {
      RtcEngine rtcEngine = createAgoraRtcEngine();
      await rtcEngine.initialize(RtcEngineContext(
        appId: 'app_id',
        areaCode: AreaCode.areaCodeGlob.value(),
      ));
      final mediaPlayerController = MediaPlayerController(
          rtcEngine: rtcEngine, canvas: const VideoCanvas());
      await mediaPlayerController.initialize();

      final onMetaDataCompleter = Completer<bool>();
      final theMediaPlayerSourceObserver = MediaPlayerSourceObserver(
        onMetaData: (Uint8List data, int length) {
          onMetaDataCompleter.complete(true);
        },
      );

      mediaPlayerController.registerPlayerSourceObserver(
        theMediaPlayerSourceObserver,
      );

// Delay 500 milliseconds to ensure the registerPlayerSourceObserver call completed.
      await Future.delayed(const Duration(milliseconds: 500));

      {
        Uint8List data = Uint8List.fromList([1, 2, 3, 4, 5]);
        const int length = 10;

        final eventJson = {
          'data': data.toList(),
          'length': length,
        };

        if (!kIsWeb) {
          irisTester.fireEvent('MediaPlayerSourceObserver_onMetaData',
              params: eventJson);
        } else {
          final ret = irisTester.fireEvent(
              'MediaPlayerSourceObserver_onMetaData',
              params: eventJson);
// Delay 200 milliseconds to ensure the callback is called.
          await Future.delayed(const Duration(milliseconds: 200));
// TODO(littlegnal): Most of callbacks on web are not implemented, we're temporarily skip these callbacks at this time.
          if (ret) {
            if (!onMetaDataCompleter.isCompleted) {
              onMetaDataCompleter.complete(true);
            }
          }
        }
      }

      final eventCalled = await onMetaDataCompleter.future;
      expect(eventCalled, isTrue);

      {
        mediaPlayerController.unregisterPlayerSourceObserver(
          theMediaPlayerSourceObserver,
        );
      }
// Delay 500 milliseconds to ensure the unregisterPlayerSourceObserver call completed.
      await Future.delayed(const Duration(milliseconds: 500));

      await rtcEngine.release();
    },
    timeout: const Timeout(Duration(minutes: 2)),
  );

  testWidgets(
    'onPlayBufferUpdated',
    (WidgetTester tester) async {
      RtcEngine rtcEngine = createAgoraRtcEngine();
      await rtcEngine.initialize(RtcEngineContext(
        appId: 'app_id',
        areaCode: AreaCode.areaCodeGlob.value(),
      ));
      final mediaPlayerController = MediaPlayerController(
          rtcEngine: rtcEngine, canvas: const VideoCanvas());
      await mediaPlayerController.initialize();

      final onPlayBufferUpdatedCompleter = Completer<bool>();
      final theMediaPlayerSourceObserver = MediaPlayerSourceObserver(
        onPlayBufferUpdated: (int playCachedBuffer) {
          onPlayBufferUpdatedCompleter.complete(true);
        },
      );

      mediaPlayerController.registerPlayerSourceObserver(
        theMediaPlayerSourceObserver,
      );

// Delay 500 milliseconds to ensure the registerPlayerSourceObserver call completed.
      await Future.delayed(const Duration(milliseconds: 500));

      {
        const int playCachedBuffer = 10;

        final eventJson = {
          'playCachedBuffer': playCachedBuffer,
        };

        if (!kIsWeb) {
          irisTester.fireEvent('MediaPlayerSourceObserver_onPlayBufferUpdated',
              params: eventJson);
        } else {
          final ret = irisTester.fireEvent(
              'MediaPlayerSourceObserver_onPlayBufferUpdated',
              params: eventJson);
// Delay 200 milliseconds to ensure the callback is called.
          await Future.delayed(const Duration(milliseconds: 200));
// TODO(littlegnal): Most of callbacks on web are not implemented, we're temporarily skip these callbacks at this time.
          if (ret) {
            if (!onPlayBufferUpdatedCompleter.isCompleted) {
              onPlayBufferUpdatedCompleter.complete(true);
            }
          }
        }
      }

      final eventCalled = await onPlayBufferUpdatedCompleter.future;
      expect(eventCalled, isTrue);

      {
        mediaPlayerController.unregisterPlayerSourceObserver(
          theMediaPlayerSourceObserver,
        );
      }
// Delay 500 milliseconds to ensure the unregisterPlayerSourceObserver call completed.
      await Future.delayed(const Duration(milliseconds: 500));

      await rtcEngine.release();
    },
    timeout: const Timeout(Duration(minutes: 2)),
  );

  testWidgets(
    'onPreloadEvent',
    (WidgetTester tester) async {
      RtcEngine rtcEngine = createAgoraRtcEngine();
      await rtcEngine.initialize(RtcEngineContext(
        appId: 'app_id',
        areaCode: AreaCode.areaCodeGlob.value(),
      ));
      final mediaPlayerController = MediaPlayerController(
          rtcEngine: rtcEngine, canvas: const VideoCanvas());
      await mediaPlayerController.initialize();

      final onPreloadEventCompleter = Completer<bool>();
      final theMediaPlayerSourceObserver = MediaPlayerSourceObserver(
        onPreloadEvent: (String src, PlayerPreloadEvent event) {
          onPreloadEventCompleter.complete(true);
        },
      );

      mediaPlayerController.registerPlayerSourceObserver(
        theMediaPlayerSourceObserver,
      );

// Delay 500 milliseconds to ensure the registerPlayerSourceObserver call completed.
      await Future.delayed(const Duration(milliseconds: 500));

      {
        const String src = "hello";
        const PlayerPreloadEvent event =
            PlayerPreloadEvent.playerPreloadEventBegin;

        final eventJson = {
          'src': src,
          'event': event.value(),
        };

        if (!kIsWeb) {
          irisTester.fireEvent('MediaPlayerSourceObserver_onPreloadEvent',
              params: eventJson);
        } else {
          final ret = irisTester.fireEvent(
              'MediaPlayerSourceObserver_onPreloadEvent',
              params: eventJson);
// Delay 200 milliseconds to ensure the callback is called.
          await Future.delayed(const Duration(milliseconds: 200));
// TODO(littlegnal): Most of callbacks on web are not implemented, we're temporarily skip these callbacks at this time.
          if (ret) {
            if (!onPreloadEventCompleter.isCompleted) {
              onPreloadEventCompleter.complete(true);
            }
          }
        }
      }

      final eventCalled = await onPreloadEventCompleter.future;
      expect(eventCalled, isTrue);

      {
        mediaPlayerController.unregisterPlayerSourceObserver(
          theMediaPlayerSourceObserver,
        );
      }
// Delay 500 milliseconds to ensure the unregisterPlayerSourceObserver call completed.
      await Future.delayed(const Duration(milliseconds: 500));

      await rtcEngine.release();
    },
    timeout: const Timeout(Duration(minutes: 2)),
  );

  testWidgets(
    'onCompleted',
    (WidgetTester tester) async {
      RtcEngine rtcEngine = createAgoraRtcEngine();
      await rtcEngine.initialize(RtcEngineContext(
        appId: 'app_id',
        areaCode: AreaCode.areaCodeGlob.value(),
      ));
      final mediaPlayerController = MediaPlayerController(
          rtcEngine: rtcEngine, canvas: const VideoCanvas());
      await mediaPlayerController.initialize();

      final onCompletedCompleter = Completer<bool>();
      final theMediaPlayerSourceObserver = MediaPlayerSourceObserver(
        onCompleted: () {
          onCompletedCompleter.complete(true);
        },
      );

      mediaPlayerController.registerPlayerSourceObserver(
        theMediaPlayerSourceObserver,
      );

// Delay 500 milliseconds to ensure the registerPlayerSourceObserver call completed.
      await Future.delayed(const Duration(milliseconds: 500));

      {
        final eventJson = {};

        if (!kIsWeb) {
          irisTester.fireEvent('MediaPlayerSourceObserver_onCompleted',
              params: eventJson);
        } else {
          final ret = irisTester.fireEvent(
              'MediaPlayerSourceObserver_onCompleted',
              params: eventJson);
// Delay 200 milliseconds to ensure the callback is called.
          await Future.delayed(const Duration(milliseconds: 200));
// TODO(littlegnal): Most of callbacks on web are not implemented, we're temporarily skip these callbacks at this time.
          if (ret) {
            if (!onCompletedCompleter.isCompleted) {
              onCompletedCompleter.complete(true);
            }
          }
        }
      }

      final eventCalled = await onCompletedCompleter.future;
      expect(eventCalled, isTrue);

      {
        mediaPlayerController.unregisterPlayerSourceObserver(
          theMediaPlayerSourceObserver,
        );
      }
// Delay 500 milliseconds to ensure the unregisterPlayerSourceObserver call completed.
      await Future.delayed(const Duration(milliseconds: 500));

      await rtcEngine.release();
    },
    timeout: const Timeout(Duration(minutes: 2)),
  );

  testWidgets(
    'onAgoraCDNTokenWillExpire',
    (WidgetTester tester) async {
      RtcEngine rtcEngine = createAgoraRtcEngine();
      await rtcEngine.initialize(RtcEngineContext(
        appId: 'app_id',
        areaCode: AreaCode.areaCodeGlob.value(),
      ));
      final mediaPlayerController = MediaPlayerController(
          rtcEngine: rtcEngine, canvas: const VideoCanvas());
      await mediaPlayerController.initialize();

      final onAgoraCDNTokenWillExpireCompleter = Completer<bool>();
      final theMediaPlayerSourceObserver = MediaPlayerSourceObserver(
        onAgoraCDNTokenWillExpire: () {
          onAgoraCDNTokenWillExpireCompleter.complete(true);
        },
      );

      mediaPlayerController.registerPlayerSourceObserver(
        theMediaPlayerSourceObserver,
      );

// Delay 500 milliseconds to ensure the registerPlayerSourceObserver call completed.
      await Future.delayed(const Duration(milliseconds: 500));

      {
        final eventJson = {};

        if (!kIsWeb) {
          irisTester.fireEvent(
              'MediaPlayerSourceObserver_onAgoraCDNTokenWillExpire',
              params: eventJson);
        } else {
          final ret = irisTester.fireEvent(
              'MediaPlayerSourceObserver_onAgoraCDNTokenWillExpire',
              params: eventJson);
// Delay 200 milliseconds to ensure the callback is called.
          await Future.delayed(const Duration(milliseconds: 200));
// TODO(littlegnal): Most of callbacks on web are not implemented, we're temporarily skip these callbacks at this time.
          if (ret) {
            if (!onAgoraCDNTokenWillExpireCompleter.isCompleted) {
              onAgoraCDNTokenWillExpireCompleter.complete(true);
            }
          }
        }
      }

      final eventCalled = await onAgoraCDNTokenWillExpireCompleter.future;
      expect(eventCalled, isTrue);

      {
        mediaPlayerController.unregisterPlayerSourceObserver(
          theMediaPlayerSourceObserver,
        );
      }
// Delay 500 milliseconds to ensure the unregisterPlayerSourceObserver call completed.
      await Future.delayed(const Duration(milliseconds: 500));

      await rtcEngine.release();
    },
    timeout: const Timeout(Duration(minutes: 2)),
  );

  testWidgets(
    'onPlayerSrcInfoChanged',
    (WidgetTester tester) async {
      RtcEngine rtcEngine = createAgoraRtcEngine();
      await rtcEngine.initialize(RtcEngineContext(
        appId: 'app_id',
        areaCode: AreaCode.areaCodeGlob.value(),
      ));
      final mediaPlayerController = MediaPlayerController(
          rtcEngine: rtcEngine, canvas: const VideoCanvas());
      await mediaPlayerController.initialize();

      final onPlayerSrcInfoChangedCompleter = Completer<bool>();
      final theMediaPlayerSourceObserver = MediaPlayerSourceObserver(
        onPlayerSrcInfoChanged: (SrcInfo from, SrcInfo to) {
          onPlayerSrcInfoChangedCompleter.complete(true);
        },
      );

      mediaPlayerController.registerPlayerSourceObserver(
        theMediaPlayerSourceObserver,
      );

// Delay 500 milliseconds to ensure the registerPlayerSourceObserver call completed.
      await Future.delayed(const Duration(milliseconds: 500));

      {
        const int fromBitrateInKbps = 10;
        const String fromName = "hello";
        const SrcInfo from = SrcInfo(
          bitrateInKbps: fromBitrateInKbps,
          name: fromName,
        );
        const int toBitrateInKbps = 10;
        const String toName = "hello";
        const SrcInfo to = SrcInfo(
          bitrateInKbps: toBitrateInKbps,
          name: toName,
        );

        final eventJson = {
          'from': from.toJson(),
          'to': to.toJson(),
        };

        if (!kIsWeb) {
          irisTester.fireEvent(
              'MediaPlayerSourceObserver_onPlayerSrcInfoChanged',
              params: eventJson);
        } else {
          final ret = irisTester.fireEvent(
              'MediaPlayerSourceObserver_onPlayerSrcInfoChanged',
              params: eventJson);
// Delay 200 milliseconds to ensure the callback is called.
          await Future.delayed(const Duration(milliseconds: 200));
// TODO(littlegnal): Most of callbacks on web are not implemented, we're temporarily skip these callbacks at this time.
          if (ret) {
            if (!onPlayerSrcInfoChangedCompleter.isCompleted) {
              onPlayerSrcInfoChangedCompleter.complete(true);
            }
          }
        }
      }

      final eventCalled = await onPlayerSrcInfoChangedCompleter.future;
      expect(eventCalled, isTrue);

      {
        mediaPlayerController.unregisterPlayerSourceObserver(
          theMediaPlayerSourceObserver,
        );
      }
// Delay 500 milliseconds to ensure the unregisterPlayerSourceObserver call completed.
      await Future.delayed(const Duration(milliseconds: 500));

      await rtcEngine.release();
    },
    timeout: const Timeout(Duration(minutes: 2)),
  );

  testWidgets(
    'onPlayerInfoUpdated',
    (WidgetTester tester) async {
      RtcEngine rtcEngine = createAgoraRtcEngine();
      await rtcEngine.initialize(RtcEngineContext(
        appId: 'app_id',
        areaCode: AreaCode.areaCodeGlob.value(),
      ));
      final mediaPlayerController = MediaPlayerController(
          rtcEngine: rtcEngine, canvas: const VideoCanvas());
      await mediaPlayerController.initialize();

      final onPlayerInfoUpdatedCompleter = Completer<bool>();
      final theMediaPlayerSourceObserver = MediaPlayerSourceObserver(
        onPlayerInfoUpdated: (PlayerUpdatedInfo info) {
          onPlayerInfoUpdatedCompleter.complete(true);
        },
      );

      mediaPlayerController.registerPlayerSourceObserver(
        theMediaPlayerSourceObserver,
      );

// Delay 500 milliseconds to ensure the registerPlayerSourceObserver call completed.
      await Future.delayed(const Duration(milliseconds: 500));

      {
        const int cacheStatisticsFileSize = 10;
        const int cacheStatisticsCacheSize = 10;
        const int cacheStatisticsDownloadSize = 10;
        const CacheStatistics infoCacheStatistics = CacheStatistics(
          fileSize: cacheStatisticsFileSize,
          cacheSize: cacheStatisticsCacheSize,
          downloadSize: cacheStatisticsDownloadSize,
        );
        const String infoPlayerId = "hello";
        const String infoDeviceId = "hello";
        const PlayerUpdatedInfo info = PlayerUpdatedInfo(
          playerId: infoPlayerId,
          deviceId: infoDeviceId,
          cacheStatistics: infoCacheStatistics,
        );

        final eventJson = {
          'info': info.toJson(),
        };

        if (!kIsWeb) {
          irisTester.fireEvent('MediaPlayerSourceObserver_onPlayerInfoUpdated',
              params: eventJson);
        } else {
          final ret = irisTester.fireEvent(
              'MediaPlayerSourceObserver_onPlayerInfoUpdated',
              params: eventJson);
// Delay 200 milliseconds to ensure the callback is called.
          await Future.delayed(const Duration(milliseconds: 200));
// TODO(littlegnal): Most of callbacks on web are not implemented, we're temporarily skip these callbacks at this time.
          if (ret) {
            if (!onPlayerInfoUpdatedCompleter.isCompleted) {
              onPlayerInfoUpdatedCompleter.complete(true);
            }
          }
        }
      }

      final eventCalled = await onPlayerInfoUpdatedCompleter.future;
      expect(eventCalled, isTrue);

      {
        mediaPlayerController.unregisterPlayerSourceObserver(
          theMediaPlayerSourceObserver,
        );
      }
// Delay 500 milliseconds to ensure the unregisterPlayerSourceObserver call completed.
      await Future.delayed(const Duration(milliseconds: 500));

      await rtcEngine.release();
    },
    timeout: const Timeout(Duration(minutes: 2)),
  );

  testWidgets(
    'onAudioVolumeIndication',
    (WidgetTester tester) async {
      RtcEngine rtcEngine = createAgoraRtcEngine();
      await rtcEngine.initialize(RtcEngineContext(
        appId: 'app_id',
        areaCode: AreaCode.areaCodeGlob.value(),
      ));
      final mediaPlayerController = MediaPlayerController(
          rtcEngine: rtcEngine, canvas: const VideoCanvas());
      await mediaPlayerController.initialize();

      final onAudioVolumeIndicationCompleter = Completer<bool>();
      final theMediaPlayerSourceObserver = MediaPlayerSourceObserver(
        onAudioVolumeIndication: (int volume) {
          onAudioVolumeIndicationCompleter.complete(true);
        },
      );

      mediaPlayerController.registerPlayerSourceObserver(
        theMediaPlayerSourceObserver,
      );

// Delay 500 milliseconds to ensure the registerPlayerSourceObserver call completed.
      await Future.delayed(const Duration(milliseconds: 500));

      {
        const int volume = 10;

        final eventJson = {
          'volume': volume,
        };

        if (!kIsWeb) {
          irisTester.fireEvent(
              'MediaPlayerSourceObserver_onAudioVolumeIndication',
              params: eventJson);
        } else {
          final ret = irisTester.fireEvent(
              'MediaPlayerSourceObserver_onAudioVolumeIndication',
              params: eventJson);
// Delay 200 milliseconds to ensure the callback is called.
          await Future.delayed(const Duration(milliseconds: 200));
// TODO(littlegnal): Most of callbacks on web are not implemented, we're temporarily skip these callbacks at this time.
          if (ret) {
            if (!onAudioVolumeIndicationCompleter.isCompleted) {
              onAudioVolumeIndicationCompleter.complete(true);
            }
          }
        }
      }

      final eventCalled = await onAudioVolumeIndicationCompleter.future;
      expect(eventCalled, isTrue);

      {
        mediaPlayerController.unregisterPlayerSourceObserver(
          theMediaPlayerSourceObserver,
        );
      }
// Delay 500 milliseconds to ensure the unregisterPlayerSourceObserver call completed.
      await Future.delayed(const Duration(milliseconds: 500));

      await rtcEngine.release();
    },
    timeout: const Timeout(Duration(minutes: 2)),
  );
}
