import 'dart:io';

import 'package:facesign_frontend/src/core/datamodels/user_identity.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:web_socket_channel/io.dart';

// Used for auto generation provided by 'freezed' plugin.
// Run 'flutter pub run build_runner {build|watch}' to generate code.
// part 'connection_state.freezed.dart';

final wsAddressProvider = StateProvider<String?>((ref) => null);

final wsStreamProvider = StreamProvider.autoDispose.family<String, String>((ref, wsAddr) async* {
  // https://stackoverflow.com/questions/59011160/iowebsocketchannel-detect-when-the-connection-is-open
  // var io = IOWebSocketChannel()


  final channel = WebSocketChannel.connect(Uri.parse(wsAddr));
  ref.onDispose(() { channel.sink.close(); });

  await for (final value in channel.stream){
    yield value.toString();
  }
});
