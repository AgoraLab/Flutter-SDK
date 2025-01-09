// ignore_for_file: avoid_print

import 'dart:io';
import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:agora_rtc_engine_example/config/agora.config.dart' as config;
import 'package:agora_rtc_engine_example/components/example_actions_widget.dart';
import 'package:flutter/material.dart';

///=============================================
/// PictureInPicture Example
class PictureInPicture extends StatefulWidget {
  /// Construct the [PictureInPicture]
  const PictureInPicture({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State<PictureInPicture> with WidgetsBindingObserver {
  late final RtcEngine _engine;
  late final RtcEngineEventHandler _rtcEngineEventHandler;

  late TextEditingController _channelIdController;
  VideoViewController? _videoViewController;

  bool _isInPipMode = false;
  bool _isPipSupported = false;
  bool _isPipAutoEnterSupported = false;
  AppLifecycleState? _lastAppLifecycleState;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _channelIdController = TextEditingController(text: config.channelId);

    _initEngine();
  }

  @override
  Future<void> didChangeAppLifecycleState(AppLifecycleState state) async {
    super.didChangeAppLifecycleState(state);
    print("pip: didChangeAppLifecycleState: $state");

    if (state == AppLifecycleState.inactive) {
      // if you set the root view as the source view, you can call pipStart to enter pip mode on iOS.
      // however, if you call pipSetup after PlatformView is created, it may not work very well, coz
      // the source view need some time to be ready. So the best practice is set the autoEnterEnabled to true if
      // it is supported and call pipStart only in the resumed state.
      if (_lastAppLifecycleState != AppLifecycleState.paused &&
          !_isPipAutoEnterSupported) {
        await _engine.pipStart();
      }
    } else if (state == AppLifecycleState.resumed) {
      if (!Platform.isAndroid) {
        // on Android, the pipStop is not supported, the pipStop operation is only bring the activity to background.
        await _engine.pipStop();
      }
    }

    // do not auto enter pip when app recovered from paused state, and the hidden state always
    // triggers before change to the next state on both Android and iOS.
    if (state != AppLifecycleState.hidden && _lastAppLifecycleState != state) {
      setState(() {
        _lastAppLifecycleState = state;
      });
    }
  }

  @override
  Future<void> dispose() async {
    _channelIdController.dispose();
    WidgetsBinding.instance.removeObserver(this);

    _dispose();

    super.dispose();
  }

  Future<void> _dispose() async {
    _engine.unregisterEventHandler(_rtcEngineEventHandler);
    await _engine.unregisterPipStateChangedObserver();
    await _engine.pipDispose();
    await _engine.leaveChannel();
    await _engine.release();
  }

  Future<void> _setupPip(
      RtcConnection? connection, int? remoteUid, int? viewId) async {
    AgoraPipOptions options = AgoraPipOptions(
      autoEnterEnabled: _isPipAutoEnterSupported,
      // android only
      aspectRatioX: 16,
      aspectRatioY: 9,
      sourceRectHintLeft: 0,
      sourceRectHintTop: 0,
      sourceRectHintRight: 100,
      sourceRectHintBottom: 100,
      // ios only
      preferredContentWidth: 960,
      preferredContentHeight: 540,

      connection: connection,
      videoCanvas: (remoteUid != null && viewId != null)
          ? VideoCanvas(
              uid: remoteUid,
              view: viewId,
              mirrorMode: VideoMirrorModeType.videoMirrorModeDisabled,
              renderMode: RenderModeType.renderModeFit,
              sourceType: VideoSourceType.videoSourceRemote,
            )
          : null,
    );

    await _engine.pipSetup(options);
  }

  Future<void> _initEngine() async {
    _engine = createAgoraRtcEngine();
    await _engine.initialize(RtcEngineContext(
      appId: config.appId,
    ));
    _rtcEngineEventHandler = RtcEngineEventHandler(
      onJoinChannelSuccess: (RtcConnection connection, int elapsed) {},
      onUserJoined: (RtcConnection connection, int rUid, int elapsed) {
        print('pip: userJoined: $rUid');
        var newVideoViewController = VideoViewController.remote(
          rtcEngine: _engine,
          canvas: VideoCanvas(uid: rUid),
          connection: RtcConnection(channelId: _channelIdController.text),
        );

        // call pipSetup here just for testing purpose
        // in normal case, we often call pipDispose if remote user left the channel,
        // call pipSetup here is just want to test whether if you change the remote user,
        // the video track of pip view will be updated.
        // if (Platform.isIOS) {
        //   _setupPip(
        //       RtcConnection(
        //           channelId: _channelIdController.text, localUid: config.uid),
        //       rUid,
        //       0 /* use the root view */);
        // }

        setState(() {
          _videoViewController = newVideoViewController;
        });
      },
      onUserOffline:
          (RtcConnection connection, int rUid, UserOfflineReasonType reason) {
        print('pip: userOffline: $rUid');

        if (Platform.isIOS) {
          _engine.pipDispose();
        }
      },
      onLeaveChannel: (RtcConnection connection, RtcStats stats) {},
      onRemoteVideoStateChanged:
          (connection, remoteUid, state, reason, elapsed) {
        print('pip: remoteVideoStateChanged: $remoteUid, $state $reason');
      },
    );

    _engine.registerEventHandler(_rtcEngineEventHandler);
    _engine.registerPipStateChangedObserver(AgoraPipStateChangedObserver(
      onPipStateChanged: (state, error) {
        print('pip: onPipStateChanged: $state, $error');
        setState(() {
          _isInPipMode = state == AgoraPipState.pipStateStarted;
        });

        if (state == AgoraPipState.pipStateFailed) {
          print('pip: onPipStateChanged: $state, $error');
          // if you destroy the source view of pip controller, some error may happen,
          // so we need to dispose the pip controller here.
          _engine.pipDispose();
        }
      },
    ));

    await _engine.enableVideo();
    var isPipSupported = await _engine.isPipSupported();
    var isPipAutoEnterSupported = await _engine.isPipAutoEnterSupported();

    // There is no need to set connection and videoCanvas for pipSetup on Android,
    // because the pipSetup will use the root view as the source view.
    if (Platform.isAndroid && isPipSupported) {
      _setupPip(null, null, null);
    }

    setState(() {
      _isPipSupported = isPipSupported;
      _isPipAutoEnterSupported = isPipAutoEnterSupported;
    });
  }

  Future<void> _joinChannel() async {
    await _engine.joinChannel(
      token: config.token,
      channelId: _channelIdController.text,
      uid: config.uid,
      options: const ChannelMediaOptions(
        clientRoleType: ClientRoleType.clientRoleAudience,
      ),
    );
  }

  Future<void> _leaveChannel() async {
    await _videoViewController?.dispose();

    await _engine.leaveChannel();

    if (Platform.isIOS) {
      _engine.pipDispose();
    }

    setState(() {
      _videoViewController = null;
    });
  }

  Widget _videoViewStack() {
    return Stack(
      alignment: Alignment.center,
      children: [
        if (_videoViewController != null)
          AgoraVideoView(
            controller: _videoViewController!,
            onAgoraVideoViewCreated: (viewId) async {
              print("pip: onAgoraVideoViewCreated $viewId");
              if (Platform.isIOS) {
                _setupPip(
                    RtcConnection(
                        channelId: _channelIdController.text,
                        localUid: config.uid),
                    _videoViewController!.canvas.uid,
                    viewId);
              }
            },
          ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    if (_isPipSupported == false) {
      return const Center(
        child: Text('The picture-in-picture is not supported on this device.'),
      );
    }

    // only show the video view in pip mode on Android
    if (Platform.isAndroid && _isInPipMode) {
      return _videoViewStack();
    }

    return ExampleActionsWidget(
      displayContentBuilder: (context, isLayoutHorizontal) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(child: _videoViewStack()),
            const SizedBox(
              height: 50,
            )
          ],
        );
      },
      actionsBuilder: (context, isLayoutHorizontal) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: ElevatedButton(
                    onPressed: _joinChannel,
                    child: const Text('Join channel'),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: ElevatedButton(
                    onPressed: _leaveChannel,
                    child: const Text('Leave channel'),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              controller: _channelIdController,
              decoration: const InputDecoration(hintText: 'Channel ID'),
            ),
          ],
        );
      },
    );
  }
}
