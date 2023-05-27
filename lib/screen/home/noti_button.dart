import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/bloc/noti/noti_bloc.dart';
import 'package:weatherapp/bloc/noti/noti_count_cubit.dart';
import 'package:weatherapp/bloc/noti/noti_event.dart';
import 'package:weatherapp/screen/noti/noti_screen.dart';
import 'package:weatherapp/utils/constants.dart';

class NotiButton extends StatelessWidget {
  const NotiButton({super.key});

  @override
  Widget build(BuildContext context) {
    final NotiBloc notiBloc = BlocProvider.of<NotiBloc>(context);
    final NotiCountCubit notiCountCubit = context.watch();
    //  final NotiCountCubit notiCountCubit = context.read<NotiCountCubit>();
    notiCountCubit.changeNotiCount();

    goNotiPage() {
      notiBloc.add(const FetchNoti());

      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const NotiScreen()));
    }

    return GestureDetector(
      onTap: goNotiPage,
      child: Container(
        width: 40,
        height: 40,
        decoration:
            BoxDecoration(color: Colors.grey.shade100, shape: BoxShape.circle),
        child: Stack(
          children: [
            IconButton(
                padding: EdgeInsets.zero,
                color: Colors.blue,
                splashRadius: 20,
                onPressed: goNotiPage,
                icon: const Icon(Icons.notifications)),
            if (notiCountCubit.state != 0)
              Positioned(
                  top: 0,
                  right: 1,
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        color: ConstantUtils.primaryColor,
                        shape: BoxShape.circle,
                        border: Border.all(width: 2, color: Colors.white)),
                    child: Text(
                      notiCountCubit.state.toString(),
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 7,
                          fontWeight: FontWeight.bold),
                    ),
                  ))
          ],
        ),
      ),
    );
  }
}
