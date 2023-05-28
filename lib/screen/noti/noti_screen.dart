import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/bloc/noti/noti_event.dart';
import 'package:weatherapp/bloc/noti/noti_state.dart';
import 'package:weatherapp/controllers/favorite_controller.dart';
import 'package:weatherapp/controllers/noti_controller.dart';
import 'package:weatherapp/model/noti_model.dart';
import 'package:weatherapp/screen/noti/detail.dart';

import '../../bloc/noti/noti_bloc.dart';

class NotiScreen extends StatelessWidget {
  const NotiScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final notiBloc = BlocProvider.of<NotiBloc>(context);
    notiBloc.add(const FetchNoti());
    final NotiController notiController = NotiController();
    return Scaffold(
        appBar: AppBar(title: const Text("Notifications")),
        body: BlocBuilder<NotiBloc, NotiState>(
          builder: (context, state) {
            if (state is NotiLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is NotiLoaded) {
              if (state.notiList.isEmpty) {
                return const Center(
                  child: Text("No Data"),
                );
              }

              return ListView.builder(
                itemCount: state.notiList.length,
                padding: const EdgeInsets.all(20),
                itemBuilder: (BuildContext context, int index) {
                  NotiModel noti = state.notiList[index];

                  return Card(
                    elevation: 1,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    margin: const EdgeInsets.only(bottom: 20),
                    child: ListTile(
                      trailing: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(
                            Icons.notifications,
                            color: Colors.blue,
                          ),
                        ],
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => NotiDetail(
                                      noti: noti,
                                    )));
                      },
                      visualDensity: VisualDensity.comfortable,
                      title: Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Text(
                          noti.title,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 5),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            noti.body,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            noti.date,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            }
            if (state is NotiError) {
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
