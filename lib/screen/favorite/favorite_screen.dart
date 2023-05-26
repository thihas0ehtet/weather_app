import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/bloc/favorite/bloc.dart';
import 'package:weatherapp/controllers/favorite_controller.dart';
import 'package:weatherapp/model/favorite_model.dart';
import 'package:weatherapp/screen/favorite/detail.dart';
import 'package:weatherapp/utils/utils.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final favBloc = BlocProvider.of<FavoriteBloc>(context);
    final FavoriteController favController = FavoriteController();

    return Scaffold(
        appBar: AppBar(
            leading: const Icon(Icons.favorite),
            title: const Text("Favorites")),
        body: BlocBuilder<FavoriteBloc, FavoriteState>(
          builder: (context, state) {
            if (state is FavoriteEmpty) {
              favBloc.add(const FetchFavourite());
            }

            if (state is FavoriteLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is FavoriteLoaded) {
              return ListView.builder(
                itemCount: state.favoriteList.length,
                padding: const EdgeInsets.all(20),
                itemBuilder: (BuildContext context, int index) {
                  FavoriteModel favourite = state.favoriteList[index];

                  return Card(
                    elevation: 1,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    margin: const EdgeInsets.only(bottom: 20),
                    child: ListTile(
                      title: Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Text(
                          favourite.name,
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => FavoriteDetail(
                                      favorite: favourite,
                                    )));
                      },
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 5),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            "${favourite.region}, ${favourite.country}",
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                              "Updated: ${fullDateAndTime(favourite.lastUpdated)}"),
                          const SizedBox(
                            width: 10,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                      trailing: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 30,
                            child: PopupMenuButton(
                                padding: const EdgeInsets.all(0),
                                splashRadius: 20,
                                onSelected: (value) async {
                                  if (value == 1) {
                                    favController.hanldeDeleteFav(
                                        context, favourite.id!);
                                  }
                                },
                                icon: Icon(
                                  Icons.more_vert,
                                  color: Colors.grey.shade600,
                                ),
                                itemBuilder: (context) => [
                                      PopupMenuItem(
                                        value: 1,
                                        child: Row(
                                          children: const [
                                            Icon(
                                              Icons.delete,
                                              color: Colors.red,
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                              "Remove",
                                              style: TextStyle(fontSize: 15),
                                            )
                                          ],
                                        ),
                                      )
                                    ]),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            }
            if (state is FavoriteError) {
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
