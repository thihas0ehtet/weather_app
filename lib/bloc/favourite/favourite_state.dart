import 'package:equatable/equatable.dart';
import 'package:weatherapp/model/models.dart';

abstract class FavouriteState extends Equatable {
  const FavouriteState();

  @override
  List<Object> get props => [];
}

class FavouriteEmpty extends FavouriteState {}

class FavouriteLoading extends FavouriteState {}

class FavouriteLoaded extends FavouriteState {
  final List<FavouriteModel> favouriteList;

  const FavouriteLoaded({required this.favouriteList});

  @override
  List<Object> get props => [FavouriteModel];
}

class FavouriteError extends FavouriteState {}
