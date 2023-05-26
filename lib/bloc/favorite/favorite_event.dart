import 'package:equatable/equatable.dart';

abstract class FavoriteEvent extends Equatable {
  const FavoriteEvent();
}

class FetchFavourite extends FavoriteEvent {
  const FetchFavourite();

  @override
  List<Object> get props => [];
}
