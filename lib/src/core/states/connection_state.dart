import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/status.dart' as ws_status;

// Used for auto generation provided by 'freezed' plugin.
// Run 'flutter pub run build_runner {build|watch}' to generate code.
// part 'connection_state.freezed.dart';

final wsProvider = StateNotifierProvider<
    WebsocketConnectionStateNotifier, WebsocketConnectionWrapper>((ref) {
  return WebsocketConnectionStateNotifier();
});

/* final wsStreamProvider = StreamProvider.autoDispose((ref) async* {
  final baseWs = ref.watch(wsProvider).websocket;

  if (baseWs == null) {
    throw Exception("WebSocket is not initialized.");
  }
  final channel = IOWebSocketChannel(baseWs);
  ref.onDispose(() => channel.sink.close(ws_status.normalClosure));

  await for (final value in channel.stream) {
    yield value.toString();
  }

  if (channel.closeCode != ws_status.normalClosure) {
    throw Exception('channel closed with code ${channel.closeCode}');
  }
}); */

class WebsocketConnectionWrapper {
  WebsocketConnectionWrapper(this.websocket);
  final WebSocket? websocket;
}

class WebsocketConnectionStateNotifier
    extends StateNotifier<WebsocketConnectionWrapper> {
  WebsocketConnectionStateNotifier() : super(WebsocketConnectionWrapper(null));

  void replaceWith(WebSocket newState) {
    state = WebsocketConnectionWrapper(newState);
  }

  WebsocketConnectionWrapper update(
      WebsocketConnectionWrapper Function(WebsocketConnectionWrapper) fn) {
    final original = state;
    state = fn(original);
    return original;
  }

  @override
  void dispose() {
    state.websocket?.close();
    super.dispose();
  }
}
