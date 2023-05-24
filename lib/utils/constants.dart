import 'package:flutter/material.dart';

abstract class ConstantUtils {
  //Api Data
  static const String apiUrl = "https://api.weatherapi.com/v1";
  static const String apiKey = "d7665775f8164d2896e102617231905";
  static const int forecastDays = 3;

  //Theme Color
  static const MaterialColor primaryColor = Colors.deepOrange;

  //Method
  static const String postMethod = "POST";
  static const String putMethod = "PUT";
  static const String deleteMethod = "DELETE";
}
