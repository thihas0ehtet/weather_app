import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/bloc/favourite/bloc.dart';
import 'package:weatherapp/model/favourite_model.dart';

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
              return ListView.builder(
                itemCount: state.favouriteList.length,
                padding: const EdgeInsets.only(bottom: 10, top: 10),
                itemBuilder: (BuildContext context, int index) {
                  FavouriteModel favourite = state.favouriteList[index];

                  return Card(
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    margin:
                        const EdgeInsets.only(left: 20, right: 20, bottom: 10),
                    child: ListTile(
                      title: Text(
                        favourite.name,
                      ),
                      onTap: () {},
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 5),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(favourite.lastUpdated),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                favourite.country,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
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
                                onSelected: (value) {
                                  if (value == 1) {
                                    //  handleDeleteConfirm("this order", () async {
                                    //     await controller.handleDeleteRequest(
                                    //       "$draftOrderRoute/${order["id"]}",
                                    //     );
                                    //     controller.pullToRefresh();
                                    //   });
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
                                            Text(
                                              "Delete",
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
