import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

class DateTimeHelper {
  
  static const defaultFormatDate = 'yyyy-MM-dd';
  static const defaultFormatTime = 'HH:mm:ss';
  static const defaultFormat = '$defaultFormatDate $defaultFormatTime';

  final String locale;

  DateTimeHelper({this.locale = 'en_US'}) {
    initializeDateFormatting();
  }

  String get createdAt => DateFormat(defaultFormat, locale).format(DateTime.now());

  int get createdAtMills => DateTime.now().millisecond;
  
  int get createdAtMillsEpoch => DateTime.now().millisecondsSinceEpoch;

  int get date => DateTime.now().day;

  int get month => DateTime.now().month;

  int get year => DateTime.now().year;

  String convert({required String raw, String source = defaultFormat, required String destination}) {
    try {
      return DateFormat(destination, locale).format(DateFormat(source, locale).parse(raw));
    } catch (e) {
      return '$e';
    }
  }

  DateTime toDateTime({required String dateTime, String format = defaultFormat}) {
    try {
      return DateFormat(format, locale).parse(dateTime);
    } catch (e) {
      throw '$e';
    }
  }

  DateTime toDate({required String date, String format = defaultFormatDate}) {
    try {
      return DateFormat(format, locale).parse(date);
    } catch (e) {
      throw '$e';
    }
  }
}