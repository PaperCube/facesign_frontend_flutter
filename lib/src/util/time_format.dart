class TimeFormat {
  static String formatDateTime(DateTime? dateTime, {String defaultVal = ''}) {
    if (dateTime == null) {
      return defaultVal;
    }
    final hour = dateTime.hour.toString().padLeft(2, '0');
    final minute = dateTime.minute.toString().padLeft(2, '0');
    final second = dateTime.second.toString().padLeft(2, '0');
    return '${dateTime.year}/${dateTime.month}/${dateTime.day} $hour:$minute:$second';
  }

  static String formatDuration(Duration? duration, {String defaultVal = ''}) {
    if (duration == null) {
      return defaultVal;
    }
    return '${duration.inHours}小时${duration.inMinutes % 60}分${duration.inSeconds % 60}秒';
  }
}
