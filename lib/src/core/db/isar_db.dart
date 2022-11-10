import 'dart:io';

import 'package:facesign_frontend/src/core/db/sign_record.dart';
import 'package:facesign_frontend/src/core/db/user_entry.dart';
import 'package:isar/isar.dart';

export 'package:isar/isar.dart';
export 'sign_record.dart';
export 'user_entry.dart';

import 'package:path/path.dart' as p;

Isar? _isardb;

Isar get isardb {
  if (_isardb == null) {
    final path = p.absolute(p.join(p.current, '_wd/'));
    Directory(path).createSync(recursive: true);

    _isardb = Isar.openSync([
      UserEntrySchema,
      FaceDescriptorSchema,
      SignRecordSchema,
    ], name: 'defaultdb', directory: path);
  }
  return _isardb!;
}
