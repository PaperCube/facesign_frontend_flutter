import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:facesign_frontend/src/core/datamodels/face_frame.dart';
import 'package:facesign_frontend/src/core/states/connection_state.dart';
import 'package:facesign_frontend/src/core/states/face_frame_state.dart';
import 'package:facesign_frontend/src/core/states/sign_state.dart';
import 'package:facesign_frontend/src/ui/pages/face_preview_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/status.dart' as ws_status;

import 'package:facesign_frontend/src/ui/pages/management_buttons_widget.dart';
import 'package:facesign_frontend/src/ui/pages/sign_status_widget.dart';

class SignPage extends ConsumerStatefulWidget {
  SignPage({super.key});

  // final WebSocket? baseWs;

  @override
  ConsumerState<SignPage> createState() => _SignPageState();
}

class _SignPageState extends ConsumerState<SignPage> {
  bool _isLoading = false;

  late final Timer _timer;
  late DateTime _clockOnDisplay;

  late final WebSocket? ws;
  StreamSubscription? _wsSubscription;

  @override
  void initState() {
    _updateClock();
    _timer = Timer.periodic(const Duration(milliseconds: 200), (timer) {
      _updateClock();
    });

    Future(() {
      ref.read(globalSignState.notifier).replaceWith(const SignState());
      ref.read(faceFrameStateProvider.notifier).setLoading();
    });

    ws = ref.read(wsProvider).websocket;
    _setupWsSubscriptionListener();
    super.initState();
  }

  void _setupWsSubscriptionListener() {
    final faceFrameProvider = ref.read(faceFrameStateProvider.notifier);
    try {
      _wsSubscription?.cancel();

      _wsSubscription = ws?.listen(
        (data) {
          try {
            faceFrameProvider.updateWithWSMessageFrameBytes(data);
          } catch (err, stackTrace) {
            faceFrameProvider.setError(err, stackTrace);
            print(stackTrace.toString());
          }
        },
        onError: (err, stacktrace) {
          faceFrameProvider.setError(err, stacktrace);
        },
        cancelOnError: true,
      );
    } catch (err, stackTrace) {
      Future(() {
        faceFrameProvider.setError(err, stackTrace);
      });
    }
  }

  StreamSubscription? _cancelWsSubscriptionListener() {
    final ret = _wsSubscription?..cancel();
    _wsSubscription = null;
    return ret;
  }

  @override
  void dispose() {
    _timer.cancel();
    print('ws is null? ${ws == null}');
    ws?.close(ws_status.normalClosure);
    _cancelWsSubscriptionListener();
    super.dispose();
  }

  Widget _buildFacePreviewWidget() {
    // print(_faceFrame.value!.videoFrame!.length);
    return const FacePreviewWidget();
  }

  Widget _buildStatusWidget() {
    return const SignStatusWidget();
  }

  Widget _buildMainWidget() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.all(36.0),
              child: _buildFacePreviewWidget(),
            ),
          ),
          Expanded(
            child: _buildStatusWidget(),
          ),
        ],
      ),
    );
  }

  Widget _buildLoading() {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: LinearProgressIndicator(
        value: null,
      ),
    );
  }

  Widget _buildClockWidget() {
    String p2(obj) {
      return obj.toString().padLeft(2, '0');
    }

    final clk = _clockOnDisplay;
    final date = '${clk.year}/${clk.month}/${clk.day}';
    final time = '${p2(clk.hour)}:${p2(clk.minute)}:${p2(clk.second)}';
    return Container(
      margin: const EdgeInsets.all(12.0),
      alignment: Alignment.topLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(date),
          Text(
            time,
            style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 24),
          )
        ],
      ),
    );
  }

  Widget _buildManagementButtons() {
    return const ManagementButtonsWidget();
  }

  bool _isPaused = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          if (_isLoading) _buildLoading(),
          _buildClockWidget(),
          _buildManagementButtons(),
          _buildMainWidget(),
        ],
      ),
    );
  }

  void _updateClock() {
    setState(() {
      _clockOnDisplay = DateTime.now();
    });
  }
}
