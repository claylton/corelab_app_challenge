class DateTimeFormatterUtils {
  DateTimeFormatterUtils._();

  static String getFormattedDateDateTime(DateTime? dateTime) {
    if (dateTime == null) {
      return '';
    }

    final DateTime now = DateTime.now();
    final DateTime yesterday = now.subtract(const Duration(days: 1));

    if (dateTime.day == now.day && dateTime.month == now.month && dateTime.year == now.year) {
      return 'Hoje';
    } else if (dateTime.day == yesterday.day && dateTime.month == yesterday.month && dateTime.year == yesterday.year) {
      return 'Ontem';
    }

    final String date = '${dateTime.day.toString().padLeft(2, '0')}/${dateTime.month.toString().padLeft(2, '0')}/${dateTime.year.toString()}';
    return date;
  }
}