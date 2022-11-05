import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/status.dart' as ws_status;

import 'package:facesign_frontend/src/ui/pages/management_buttons_widget.dart';
import 'package:facesign_frontend/src/ui/pages/sign_status_widget.dart';

class SignPage extends ConsumerStatefulWidget {
  SignPage({super.key, this.baseWs});

  final WebSocket? baseWs;

  @override
  ConsumerState<SignPage> createState() => _SignPageState();
}

class _SignPageState extends ConsumerState<SignPage> {
  bool _isLoading = false;

  late final Timer _timer;
  late DateTime _clockOnDisplay;

  late final wsStreamProvider = StreamProvider.autoDispose((ref) async* {
    if (widget.baseWs == null) {
      return;
    }
    final channel = IOWebSocketChannel(widget.baseWs!);
    ref.onDispose(() => channel.sink.close(ws_status.normalClosure));

    await for (final value in channel.stream) {
      yield value.toString();
    }

    if (channel.closeCode != ws_status.normalClosure) {
      throw Exception('channel closed with code ${channel.closeCode}');
    }
  });

  @override
  void initState() {
    _updateClock();
    _timer = Timer.periodic(const Duration(milliseconds: 200), (timer) {
      _updateClock();
    });
    super.initState();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  Widget _buildFacePreviewWidget() {
    final AsyncValue<String?> wsMessage = ref.watch(wsStreamProvider);

    return OverflowBox(
      maxHeight: double.infinity,
      maxWidth: double.infinity,
      child: Column(
        children: [
          const Text('Face Recog Area'),
          Text(
            wsMessage.when(
              data: (value) => value.toString(),
              error: (error, stackTrace) => error.toString(),
              loading: () => 'Loading...',
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatusWidget() {
    return SignStatusWidget();
  }

  Widget _buildMainWidget() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Container(
              alignment: Alignment.center,
              child: _buildFacePreviewWidget(),
            ),
          ),
          Expanded(
            child: Card(
              elevation: 2,
              child: AnimatedSize(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeOutCubic,
                child: Padding(
                  padding: const EdgeInsets.all(32),
                  child: UnconstrainedBox(child: _buildStatusWidget()),
                ),
              ),
            ),
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
