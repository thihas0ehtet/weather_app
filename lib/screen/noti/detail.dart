import 'package:flutter/material.dart';
import 'package:weatherapp/model/noti_model.dart';

class NotiDetail extends StatelessWidget {
  final NotiModel noti;
  const NotiDetail({super.key, required this.noti});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notification Detail"),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        children: <Widget>[
          const SizedBox(
            height: 20,
          ),
          Text(
            noti.title,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            noti.body,
          ),
          const SizedBox(
            height: 25,
          ),
        ],
      ),
    );
  }
}
