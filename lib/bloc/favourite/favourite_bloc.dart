import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:weatherapp/controllers/favourite_controller.dart';

import './bloc.dart';

class FavouriteBloc extends Bloc<FavouriteEvent, FavouriteState> {
  FavouriteBloc() : super(FavouriteEmpty()) {
    on<FetchFavourite>((event, emit) async {
      final FavouriteController favController = FavouriteController();

      emit(FavouriteLoading());

      try {
        final response = await favController.getData();
        emit(FavouriteLoaded(favouriteList: response));
      } on SocketException {
        emit(FavouriteError());
      } on Exception {
        emit(FavouriteError());
      }
    });
  }
}
