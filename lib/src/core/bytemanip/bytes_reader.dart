import 'dart:typed_data';
import 'dart:convert';

import 'package:facesign_frontend/src/core/bytemanip/bytes_x.dart';

class BytesReader {
  BytesReader.fromUint8List(
    Uint8List data, {
    int offset = 0,
    this.endian = Endian.big,
  })  : _position = offset,
        _byteData = ByteData.sublistView(data);

  final ByteData _byteData;
  Endian endian;

  int _position = 0;

  int get position => _position;

  double getFloat32() {
    final value = _byteData.getFloat32(_position, endian);
    _position += 4;
    return value;
  }

  double getFloat64() {
    final value = _byteData.getFloat64(_position, endian);
    _position += 8;
    return value;
  }

  int getInt8() {
    final value = _byteData.getInt8(_position);
    _position += 1;
    return value;
  }

  int getInt16() {
    final value = _byteData.getInt16(_position, endian);
    _position += 2;
    return value;
  }

  int getInt32() {
    final value = _byteData.getInt32(_position, endian);
    _position += 4;
    return value;
  }

  int getInt64() {
    final value = _byteData.getInt64(_position, endian);
    _position += 8;
    return value;
  }

  int getUInt8() {
    final value = _byteData.getUint8(_position);
    _position += 1;
    return value;
  }

  int getUInt16() {
    final value = _byteData.getUint16(_position, endian);
    _position += 2;
    return value;
  }

  int getUInt32() {
    final value = _byteData.getUint32(_position, endian);
    _position += 4;
    return value;
  }

  int getUInt64() {
    final value = _byteData.getUint64(_position, endian);
    _position += 8;
    return value;
  }

  ByteData getSublistView(int length) {
    final ret = ByteData.sublistView(_byteData, _position, _position + length);
    _position += length;
    return ret;
  }

  ByteData getUnmodifiableSublistView(int length) {
    return UnmodifiableByteDataView(getSublistView(length));
  }

  T fill<T extends TypedData>(T data) {
    data.buffer
        .asUint8List(data.offsetInBytes, data.lengthInBytes)
        .setAll(0, _byteData.buffer.asUint8List(_position, data.lengthInBytes));
    return data;
  }

  void skip(int length) {
    _position = RangeError.checkValidIndex(_position + length, _byteData);
  }

  String getNTString() {
    final start = _position;
    while (_byteData.getUint8(_position) != 0) {
      _position++;
    }
    final end = _position;
    _position++;
    return utf8.decode(Uint8List.sublistView(_byteData, start, end));
  }

  String getString(int length) {
    final start = _position;
    final end = _position + length;
    _position = end;
    return utf8.decode(Uint8List.sublistView(_byteData, start, end));
  }

  String getInt32SizedString() {
    final length = getInt32();
    return getString(length);
  }
}
