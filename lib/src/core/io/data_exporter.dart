import 'package:facesign_frontend/app_imports.dart';

class DataExporter {

  static Future<String> exportTodayAsString({bool withBom = false}) async {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final tomorrow = DateTime(now.year, now.month, now.day, 23, 59, 59);

    final records = await isardb.signRecords
        .filter()
        .dateTimeSignInBetween(today, tomorrow)
        .findAll();

    final users = await isardb.userEntrys.where().findAll();
    final uidNameMap = <String, String>{};
    for (final user in users) {
      if (user.name != null && user.uid != null) {
        uidNameMap[user.uid!] = user.name!;
      }
    }

    final StringBuffer b = StringBuffer();
    if (withBom) {
      b.write('\uFEFF');
    }
    b.writeln('UID,姓名,签到时间,签退时间,签到时长');
    for (final record in records) {
      final name = uidNameMap[record.uid!];
      final tIn = TimeFormat.formatDateTime(record.dateTimeSignIn);
      final tOut = TimeFormat.formatDateTime(record.dateTimeSignOut);
      final duration = record.dateTimeSignOut != null
          ? record.dateTimeSignOut!.difference(record.dateTimeSignIn!)
          : null;

      // print(record.dateTimeSignIn.toString());
      b.writeln("${record.uid},$name,$tIn,$tOut,${TimeFormat.formatDuration(duration)}");
    }

    return b.toString();
  }
}
