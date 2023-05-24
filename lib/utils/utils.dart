import 'package:intl/intl.dart';

String fullDateAndTime(String date) {
  DateTime dateTime = DateTime.parse(date);
  var formatter = DateFormat('E dd/MM/yy hh:mm a');
  String formatDate = formatter.format(dateTime);
  return formatDate;
}

String getDateOnly(String date) {
  DateTime dateTime = DateTime.parse(date);
  var formatter = DateFormat('E dd/MM/yy');
  String formatDate = formatter.format(dateTime);
  return formatDate;
}
