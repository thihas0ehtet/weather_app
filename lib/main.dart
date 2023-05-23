import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:weatherapp/bloc/weather/bloc.dart';
import 'package:weatherapp/bloc/simple_bloc_observer.dart';
import 'package:weatherapp/services/api_service.dart';
import 'package:weatherapp/services/db_services.dart';
import 'package:weatherapp/utils/constants.dart';
import 'package:weatherapp/widgets/bottom_bar.dart';

Future<void> main() async {
  Bloc.observer = SimpleBlocObserver();
  await DatabaseService.initDB();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  static const String _title = "Weather App";

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Provider<ApiService>(
        create: (context) => ApiService.create(),
        child: Consumer<ApiService>(
          builder: (context, apiService, child) {
            return MultiBlocProvider(
              providers: [
                BlocProvider<WeatherBloc>(
                  create: (context) => WeatherBloc(apiService: apiService),
                ),
              ],
              child: MaterialApp(
                theme: ThemeData(
                  primarySwatch: ConstantUtils.primaryColor,
                ),
                title: _title,
                home: const BottomBar(),
              ),
            );
          },
        ));
  }
}
