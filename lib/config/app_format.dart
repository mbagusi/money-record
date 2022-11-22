import 'package:intl/intl.dart';

class AppFormat{
  static String date(String stringDate) { // 2022-02-25
    DateTime dateTime = DateTime.parse(stringDate);
    return DateFormat('d MMM yyyy','ud_ID').format(dateTime); // 25 Feb 2022
  }
}