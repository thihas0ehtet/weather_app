import 'package:equatable/equatable.dart';
import 'package:weatherapp/model/models.dart';

abstract class FavoriteState extends Equatable {
  const FavoriteState();

  @override
  List<Object> get props => [];
}

class FavoriteEmpty extends FavoriteState {}

class FavoriteLoading extends FavoriteState {}

class FavoriteLoaded extends FavoriteState {
  final List<FavoriteModel> favoriteList;

  const FavoriteLoaded({required this.favoriteList});

  @override
  List<Object> get props => [FavoriteModel];
}

class FavoriteError extends FavoriteState {}
