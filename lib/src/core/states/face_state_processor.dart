import 'package:facesign_frontend/src/core/states/face_frame_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod/riverpod.dart';
import '../db/isar_db.dart';

void processWSSubscriptionData(dynamic data, WidgetRef ref){
  final faceFrameProvider = ref.read(faceFrameStateProvider.notifier);
}