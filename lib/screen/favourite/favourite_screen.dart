import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/bloc/favourite/bloc.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final favBloc = BlocProvider.of<FavouriteBloc>(context);
    return Scaffold(
        appBar: AppBar(
            leading: const Icon(Icons.favorite),
            title: const Text("Favourite")),
        body: BlocBuilder<FavouriteBloc, FavouriteState>(
          builder: (context, state) {
            if (state is FavouriteEmpty) {
              favBloc.add(const FetchFavourite());
            }

            if (state is FavouriteLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is FavouriteLoaded) {
              print("FavouriteLoaded is${state.favouriteList.length}");
              print(state.favouriteList);
              return ListView(
                children: const [Text("Loaded data")],
              );
            }
            if (state is FavouriteError) {
              return ListView(
                children: const <Widget>[
                  Text(
                    "Error",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ));
  }
}
