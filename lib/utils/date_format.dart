import 'package:intl/intl.dart';

class DateTimeFormat {
  static String formatDateDDMMYY(DateTime dateTime) {
    final DateFormat formatter = DateFormat('dd/MM/yy');
    return formatter.format(dateTime);
  }

  static String formatDateDDMMYYHHMM(DateTime dateTime) {
    final DateFormat formatter = DateFormat('dd/MM/yy\nHH:mm');
    return formatter.format(dateTime);
  }
}
