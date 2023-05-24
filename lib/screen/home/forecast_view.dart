import 'package:flutter/material.dart';
import 'package:weatherapp/utils/utils.dart';

class ForecastView extends StatelessWidget {
  final List forecastList;
  const ForecastView({Key? key, required this.forecastList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(vertical: 20),
        height: 130,
        width: double.infinity,
        child: ListView.builder(
            padding: const EdgeInsets.only(left: 20),
            scrollDirection: Axis.horizontal,
            itemCount: forecastList.length,
            itemBuilder: (_, i) => ViewCard(
                  forecast: forecastList[i],
                )));
  }
}

class ViewCard extends StatelessWidget {
  final Map forecast;
  const ViewCard({Key? key, required this.forecast}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.5,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15))),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              getDateOnly(forecast['date']),
              style: const TextStyle(fontSize: 13),
            ),
            const SizedBox(
              height: 3,
            ),
            Image(
                width: 30,
                height: 30,
                image: NetworkImage(
                    "https:${forecast['day']['condition']['icon']}")),
            const SizedBox(
              height: 3,
            ),
            Text(
              forecast['day']['condition']['text'] ?? "",
              style: const TextStyle(fontSize: 13),
            ),
            const SizedBox(
              height: 3,
            ),
            Text(
              "${forecast['day']['avgtemp_c'].toString()} °c (avg)",
              style: const TextStyle(fontSize: 13),
            ),
            const SizedBox(
              height: 3,
            ),
            Text(
              "${forecast['day']['avgtemp_f'].toString()} °f (avg)",
              style: const TextStyle(fontSize: 13),
            ),
          ],
        ),
      ),
    );
  }
}
