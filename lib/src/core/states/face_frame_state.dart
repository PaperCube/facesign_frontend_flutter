import 'dart:typed_data';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../datamodels/face_frame.dart';

final faceFrameStateProvider =
    StateNotifierProvider<FaceFrameStateNotifier, AsyncValue<FaceFrame>>((ref) {
  return FaceFrameStateNotifier(ref);
});

typedef _AsyncFaceFrame = AsyncValue<FaceFrame>;

class FaceFrameStateNotifier extends StateNotifier<_AsyncFaceFrame> {
  FaceFrameStateNotifier(this._ref) : super(const AsyncValue.loading()) {
    // _ref.listen(provider, (previous, next) { })
  }

  final StateNotifierProviderRef<FaceFrameStateNotifier, _AsyncFaceFrame> _ref;

  void updateWithWSMessageFrameBytes(Uint8List data){
    final newFrame = state.hasValue
        ? state.value!.updateFromWSMessageFrameBytes(data)
        : FaceFrame.fromWSMessageFrameBytes(data);
    state = AsyncValue.data(newFrame);
  }

  void setError(Object err, StackTrace stackTrace){
    state = AsyncValue.error(err, stackTrace);
  }
}
