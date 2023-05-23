import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:weatherapp/controllers/favourite_controller.dart';

import './bloc.dart';

class FavouriteBloc extends Bloc<FavouriteEvent, FavouriteState> {
  final FavouriteController favController;

  FavouriteBloc({required this.favController}) : super(FavouriteEmpty()) {
    on<FetchFavourite>((event, emit) async {
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
