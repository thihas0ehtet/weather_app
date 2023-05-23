import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/bloc/weather/weather_bloc.dart';
import 'package:weatherapp/bloc/weather/weather_event.dart';

class Search extends StatelessWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context) {
    final weatherBloc = BlocProvider.of<WeatherBloc>(context);
    final TextEditingController searchCity = TextEditingController();
    final FocusNode searchCityFN = FocusNode();

    return Column(
      children: [
        const SizedBox(
          height: 5,
        ),
        Row(
          children: <Widget>[
            Expanded(
              child: TextFormField(
                controller: searchCity,
                focusNode: searchCityFN,
                onEditingComplete: () {
                  weatherBloc.add(FetchWeather(city: searchCity.text));
                  searchCityFN.unfocus();
                },
                decoration: const InputDecoration(
                    labelText: "Search City", border: OutlineInputBorder()),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 15),
              decoration: BoxDecoration(
                  shape: BoxShape.circle, color: Colors.grey.shade200),
              child: IconButton(
                icon: const Icon(Icons.search),
                color: Colors.blue,
                onPressed: () {
                  if (searchCity.text != "") {
                    weatherBloc.add(FetchWeather(city: searchCity.text));
                    searchCityFN.unfocus();
                  }
                },
                tooltip: "Search",
              ),
            )
          ],
        ),
        const SizedBox(
          height: 20,
        )
      ],
    );
  }
}
