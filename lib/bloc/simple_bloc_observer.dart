import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SimpleBlocObserver extends BlocObserver {
  @override
  onTransition(Bloc bloc, Transition transition) {
    debugPrint('onTransition $transition');
    super.onTransition(bloc, transition);
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    debugPrint('onError $error');
    super.onError(bloc, error, stackTrace);
  }
}
