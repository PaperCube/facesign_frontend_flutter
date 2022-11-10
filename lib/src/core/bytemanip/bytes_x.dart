import 'dart:typed_data';

extension ByteDataX on ByteData {
  /// Return a deep copy of this [ByteData].
  ByteData copy() {
    final copy = ByteData(lengthInBytes);
    copy.buffer.asUint8List().setAll(0, buffer.asUint8List());
    return copy;
  }
}
