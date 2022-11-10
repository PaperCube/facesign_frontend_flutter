import 'package:isar/isar.dart';
import 'dart:math';

part 'user_entry.g.dart';

@Collection()
class UserEntry {
  UserEntry({this.name}) {
    uid = generateRandomUID();
  }

  Id id = Isar.autoIncrement;

  @Index(unique: true)
  String? uid;
  String? name;

  static String subUID() {
    const magic = 60466176;
    return Random()
        .nextInt(magic)
        .toRadixString(36)
        .padLeft(5, '0')
        .toUpperCase();
  }

  static String generateRandomUID() {
    return subUID() + subUID();
  }
}

@Collection()
class FaceDescriptor {
  Id id = Isar.autoIncrement;

  @Index(unique: true)
  String? uid;
  List<double>? encodingSet;

  DateTime? createdAt;

  int get encodingLength {
    if (encodingSet == null) return 0;
    return encodingSet!.length ~/ 128;
  }

  List<double>? encoding(int id) {
    return encodingSet!.sublist(id * 128, (id + 1) * 128);
  }

  void addFaceEncoding(List<double> encoding) {
    if (encoding.length % 128 != 0) {
      throw Exception("Encoding length must be a multiple of 128");
    }
    final res = List<double>.from(encodingSet ?? []);
    res.addAll(encoding);
    encodingSet = res;
  }

  List<double> averageEncoding() {
    final encoding = this.encodingSet;
    if (encoding == null || encoding.isEmpty) {
      throw Exception('No encoding');
    }
    final result = List<double>.filled(128, 0);

    for (var i = 0; i < encoding.length; i++) {
      result[i & 127] += encoding[i];
    }

    for (var i = 0; i < 128; i++) {
      result[i] /= encodingLength;
    }
    return result;
  }
}
