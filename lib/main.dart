import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:weatherapp/bloc/favorite/favorite_bloc.dart';
import 'package:weatherapp/bloc/weather/bloc.dart';
import 'package:weatherapp/bloc/simple_bloc_observer.dart';
import 'package:weatherapp/controllers/noti_controller.dart';
import 'package:weatherapp/services/api_service.dart';
import 'package:weatherapp/services/db_services.dart';
import 'package:weatherapp/services/local_notification_service.dart';
import 'package:weatherapp/utils/constants.dart';
import 'package:weatherapp/widgets/bottom_bar.dart';

import 'bloc/noti/noti_bloc.dart';

Future<void> backgroundHandler(RemoteMessage message) async {
  final NotiController notiController = NotiController();
  notiController.handleSaveNoti(
      message.notification!.title ?? "", message.notification!.body ?? "");
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(backgroundHandler);
  Bloc.observer = SimpleBlocObserver();
  await DatabaseService.initDB();

  runApp(Provider<ApiService>(
      create: (context) => ApiService.create(),
      child: Consumer<ApiService>(
        builder: (context, apiService, child) {
          return MultiBlocProvider(
            providers: [
              BlocProvider<WeatherBloc>(
                create: (context) => WeatherBloc(apiService: apiService),
              ),
              BlocProvider<FavoriteBloc>(
                create: (context) => FavoriteBloc(),
              ),
              BlocProvider<NotiBloc>(
                create: (context) => NotiBloc(),
              ),
            ],
            child: const MyApp(),
          );
        },
      )));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final FirebaseMessaging messaging = FirebaseMessaging.instance;

  @override
  void initState() {
    LocalNotificationService.initialize(context);

    messaging.requestPermission();
    messaging.getToken().then((value) {
      debugPrint(value);
    });

    messaging.subscribeToTopic("all");

    FirebaseMessaging.onMessage.listen((RemoteMessage event) {
      final NotiController notiController = NotiController();

      LocalNotificationService.display(event);

      notiController.handleSaveNoti(
        event.notification!.title ?? "",
        event.notification!.body ?? "",
      );
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: ConstantUtils.primaryColor,
      ),
      title: "Weather App",
      home: const BottomBar(),
    );
  }
}
