import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:weatherapp/controllers/favorite_controller.dart';

import './bloc.dart';

class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  FavoriteBloc() : super(FavoriteEmpty()) {
    on<FetchFavourite>((event, emit) async {
      final FavoriteController favController = FavoriteController();

      emit(FavoriteLoading());

      try {
        final response = await favController.getData();
        emit(FavoriteLoaded(favoriteList: response));
      } on SocketException {
        emit(FavoriteError());
      } on Exception {
        emit(FavoriteError());
      }
    });
  }
}
