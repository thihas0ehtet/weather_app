import 'dart:developer';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class FCMService {
  FCMService._internal();

  static final FCMService _instance = FCMService._internal();
  factory FCMService() => _instance;

  //Instantiate Firebase Messaging
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  Future<void> init() async {
    // For handling notification when the app is in foreground
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      log("onMessage recieved => $message");
      // log('onMessage body => ${message.notification.body}');
    });

    // For handling notification when the app is in background
    // but not terminated
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      log("onMessageOpenedApp recieved => $message");
      // log('onMessageOpenedApp body => ${message.notification.body}');
      log('onMessageOpenedApp values => ${message.data.values}');
    });

    // background notification
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

    await checkForInitialMessage();

    // refresh token
    FirebaseMessaging.instance.onTokenRefresh.listen((event) {
      log('onTokenRefresh => $event');
    });
  }

  // For handling notification when the app is in terminated state
  Future<void> checkForInitialMessage() async {
    // RemoteMessage initialMessage =
    //     await FirebaseMessaging.instance.getInitialMessage();
    // log('initialMessage => $initialMessage');
  }

  Future<void> _firebaseMessagingBackgroundHandler(
      RemoteMessage message) async {
    debugPrint("Handling a background message: ${message.messageId}");
  }

  Future<String> getFCMToken() async {
    String token = "";
    log('FCM token => $token');
    return token;
  }

  Future<void> deleteFCMToken() async {
    return await _firebaseMessaging.deleteToken();
  }
}
