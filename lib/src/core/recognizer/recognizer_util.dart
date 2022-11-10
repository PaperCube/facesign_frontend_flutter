import 'dart:math';

import 'package:facesign_frontend/src/core/datamodels/face_frame.dart';
import 'package:flutter/foundation.dart';

import '../db/isar_db.dart';

class FaceDescriptorMatch {
  FaceDescriptorMatch({
    required this.faceDescriptor,
    required this.distance,
  });

  final FaceDescriptor faceDescriptor;
  final double distance;
}

class RecognizerUtil {
  static double _vectorNorm2(List<double> vec1, List<double> vec2) {
    if (vec1.length != vec2.length) {
      throw Exception('vec1.length != vec2.length');
    }
    double sum = 0;
    for (var i = 0; i < vec1.length; i++) {
      sum += pow(vec1[i] - vec2[i], 2);
    }
    return sqrt(sum);
  }

  static double faceDistance(List<double> e1, List<double> e2) {
    return _vectorNorm2(e1, e2);
  }

  static List<FaceDescriptorMatch> _compareFacesWorker(dynamic bundle) {
    final List<FaceDescriptor> faceDescriptorList = bundle[0];
    final FaceEncodingVector toCheck = bundle[1];
    final double tolerance = bundle[2];

    final List<FaceDescriptorMatch> result = [];
    for (final FaceDescriptor faceDescriptor in faceDescriptorList) {
      final double distance = faceDistance(
          faceDescriptor.averageEncoding(), toCheck);
      if (distance < tolerance) {
        result.add(FaceDescriptorMatch(
          faceDescriptor: faceDescriptor,
          distance: distance,
        ));
      }
    }

    result.sort((a, b) => a.distance.compareTo(b.distance));
    // print(result.map((x) => x.distance).toList());

    return result;
  }

  static Future<List<FaceDescriptorMatch>> compareFacesAsync(
    List<FaceDescriptor> all,
    FaceEncodingVector toCheck, [
    double tolerance = 0.6,
  ]) async {
    return await compute(_compareFacesWorker, [all, toCheck, tolerance]);
  }
}
