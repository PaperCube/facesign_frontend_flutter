import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:facesign_frontend/src/core/states/face_frame_state.dart';

class FacePreviewWidget extends ConsumerWidget {
  const FacePreviewWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final faceFrame = ref.watch(faceFrameStateProvider);
    return faceFrame.when(
      data: (value) => ClipOval(
        child: AspectRatio(
          aspectRatio: 1,
          child: FittedBox(
            fit: BoxFit.cover,
            child: Image.memory(
              value.videoFrame!,
              gaplessPlayback: true,
            ),
          ),
        ),
      ),
      error: (error, stackTrace) => Text(error.toString()),
      loading: () => const Text('Loading...'),
    );
  }
}
