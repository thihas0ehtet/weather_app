import 'package:intl/intl.dart';

String fullDateAndTime(String date) {
  DateTime dateTime = DateTime.parse(date);
  var formatter = DateFormat('dd/MM/yy hh:mm a');
  String formatDate = formatter.format(dateTime);
  return formatDate;
}
