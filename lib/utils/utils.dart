import 'package:flutter/material.dart';
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

showSnackBar(BuildContext context, String text, {Color color = Colors.green}) {
  SnackBar snackBar = SnackBar(
    backgroundColor: color,
    duration: const Duration(seconds: 2),
    content: Text(text),
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
