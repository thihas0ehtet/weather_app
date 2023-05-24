import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weatherapp/bloc/weather/bloc.dart';
import 'package:weatherapp/screen/home/forecast_view.dart';
import 'package:weatherapp/screen/home/search.dart';
import 'package:weatherapp/screen/noti_screen.dart';
import 'package:weatherapp/utils/constants.dart';
import 'package:weatherapp/utils/utils.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final weatherBloc = BlocProvider.of<WeatherBloc>(context);

    handleSaveFavourite(WeatherState state) {
      // print(state.weatherModel.city.name);
    }

    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            foregroundColor: ConstantUtils.primaryColor,
            leading: Image.asset("assets/images/logo.png"),
            title: const Text("Weather Forecast"),
            actions: <Widget>[
              IconButton(
                icon: const Icon(Icons.notifications),
                tooltip: 'Notification',
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const NotiScreen()));
                },
              ),
            ],
          ),
          body: Container(
              // padding: const EdgeInsets.all(20),
              child: BlocBuilder<WeatherBloc, WeatherState>(
            builder: (context, state) {
              if (state is WeatherEmpty) {
                weatherBloc.add(const FetchWeather(city: "Yangon"));
              }

              if (state is WeatherLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (state is WeatherLoaded) {
                return ListView(
                  children: <Widget>[
                    const Search(),
                    Column(
                      children: <Widget>[
                        Text(
                          state.weatherModel.city.name,
                          textAlign: TextAlign.center,
                          style: GoogleFonts.roboto(
                              fontWeight: FontWeight.bold,
                              color: Colors.blue[800],
                              textStyle: Theme.of(context).textTheme.headline2),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          "${state.weatherModel.city.region}, ${state.weatherModel.city.country}",
                          style: const TextStyle(fontSize: 17),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          "Updated: ${fullDateAndTime(state.weatherModel.weatherStates.lastUpdated)}",
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: Image(
                              width: 150.0,
                              height: 70,
                              image: NetworkImage(
                                  "https:${state.weatherModel.weatherStates.condition['icon']}")),
                        ),
                        Text(
                          state.weatherModel.weatherStates.condition['text']
                              .toString(),
                          style: GoogleFonts.roboto(
                              fontWeight: FontWeight.bold,
                              color: ConstantUtils.primaryColor,
                              textStyle: Theme.of(context).textTheme.headline5),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Column(
                              children: [
                                Text(
                                  "${state.weatherModel.weatherStates.tempC.toString()} °c",
                                  style: GoogleFonts.roboto(
                                      textStyle:
                                          Theme.of(context).textTheme.headline5,
                                      color: ConstantUtils.primaryColor),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "${state.weatherModel.weatherStates.tempF.toString()} °f",
                                  style: GoogleFonts.roboto(
                                      textStyle:
                                          Theme.of(context).textTheme.headline5,
                                      color: ConstantUtils.primaryColor),
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                    "Wind: ${state.weatherModel.weatherStates.windMph.toString()} mph"),
                                const SizedBox(
                                  height: 3,
                                ),
                                Text(
                                    "Precip: ${state.weatherModel.weatherStates.precipIn.toString()} in"),
                                const SizedBox(
                                  height: 3,
                                ),
                                Text(
                                    "Pressure: ${state.weatherModel.weatherStates.pressureIn.toString()} in"),
                                const SizedBox(
                                  height: 3,
                                ),
                                Text(
                                    "Current time: ${state.weatherModel.city.localtime}")
                              ],
                            )
                          ],
                        ),
                        ForecastView(
                            forecastList:
                                state.weatherModel.forecast.forecastList),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton.icon(
                                onPressed: () => weatherBloc
                                    .add(FetchWeather(city: state.searchCity)),
                                style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all(Colors.blue)),
                                icon: const Icon(Icons.refresh),
                                label: const Text("Refresh data")),
                            const SizedBox(
                              width: 15,
                            ),
                            ElevatedButton.icon(
                                onPressed: () {},
                                icon: const Icon(Icons.favorite),
                                label: const Text("Save as favourite"))
                          ],
                        )
                      ],
                    )
                  ],
                );
              }
              if (state is WeatherError) {
                return ListView(
                  children: const <Widget>[
                    Search(),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      "No matching location found.",
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
          ))),
    );
  }
}
