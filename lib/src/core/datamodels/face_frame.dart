import 'dart:io';
import 'dart:async';
import 'dart:typed_data';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'face_frame.freezed.dart';

@freezed
class FaceFrame with _$FaceFrame {
  const factory FaceFrame({
    Uint8List? videoFrame,
    @Default([]) List<FaceInfo> faceInfo,
  }) = _FaceFrameState;

  factory FaceFrame.fromWSMessageFrameBytes(Uint8List buffer) {
    return FaceFrame(videoFrame: buffer);
  }
}

@freezed
class FaceInfo with _$FaceInfo {
  const factory FaceInfo({
    String? reservedField,
    Int64List? identityMatrix,
  }) = _FaceInfo;
}

extension FaceFrameUpdates on FaceFrame {
  FaceFrame updateFromWSMessageFrameBytes(Uint8List buffer) {
    return copyWith(videoFrame: buffer);
  }
}
