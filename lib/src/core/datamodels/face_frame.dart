import 'dart:io';
import 'dart:async';
import 'dart:typed_data';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../bytemanip/bytes_reader.dart';

part 'face_frame.freezed.dart';

typedef FaceEncodingVector = Float64List;

@freezed
class FaceFrame with _$FaceFrame {
  const factory FaceFrame({
    Uint8List? videoFrame,
    List<FaceInfo>? faceInfo,
  }) = _FaceFrameState;

  factory FaceFrame.fromWSMessageFrameBytes(Uint8List buffer) {
    return _BinaryFaceFrameParserImpl.parse(buffer);
  }
}

@freezed
class FaceInfo with _$FaceInfo {
  const factory FaceInfo({
    // String? reservedField,
    FaceEncodingVector? faceEncoding,
  }) = _FaceInfo;
}

extension FaceFrameUpdates on FaceFrame {
  FaceFrame updateFromWSMessageFrameBytes(Uint8List buffer) {
    return _BinaryFaceFrameParserImpl.parse(buffer, this);
  }
}

class MalformedFaceFrameException implements Exception {
  MalformedFaceFrameException(this.message);

  final String message;

  @override
  String toString() => 'MalformedFaceFrameException: $message';
}

class _BinaryFaceFrameParserImpl {
  static void validate(bool condition, String tag) {
    if (!condition) {
      throw MalformedFaceFrameException("Malform at $tag");
    }
  }

  static List<FaceInfo>? getFaceInfo(BytesReader reader) {
    final faceCount = reader.getInt32();
    // print('faceCount = $faceCount');
    if (faceCount < 0) return null;

    final faceInfo = <FaceInfo>[];
    for (var i = 0; i < faceCount; i++) {
      final faceEncoding = Float64List(128);
      for (var j = 0; j < 128; j++) {
        faceEncoding[j] = reader.getFloat64();
      }
      faceInfo.add(FaceInfo(faceEncoding: faceEncoding));
    }

    return faceInfo;
  }

  static FaceFrame parse(
    Uint8List buffer, [
    FaceFrame base = const FaceFrame(),
  ]) {
    final reader = BytesReader.fromUint8List(buffer);
    validate(reader.getInt32() == 1, "Invalid version");
    validate(reader.getString(4) == 'PPCB', "Invalid magic");
    reader.skip(12);

    final frameSize = reader.getInt32();
    final frameBytes = Uint8List.sublistView(reader.getSublistView(frameSize));

    final List<FaceInfo>? faceInfo = getFaceInfo(reader);

    if (faceInfo != null) {
      return base.copyWith(
        videoFrame: frameBytes,
        faceInfo: faceInfo,
      );
    } else {
      return base.copyWith(
        videoFrame: frameBytes,
      );
    }
  }
}
