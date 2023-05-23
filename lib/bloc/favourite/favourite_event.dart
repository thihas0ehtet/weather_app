import 'package:equatable/equatable.dart';

abstract class FavouriteEvent extends Equatable {
  const FavouriteEvent();
}

class FetchFavourite extends FavouriteEvent {
  const FetchFavourite();

  @override
  List<Object> get props => [];
}
