import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weatherapp/model/favorite_model.dart';
import 'package:weatherapp/screen/favorite/forecast_view.dart';
import 'package:weatherapp/utils/constants.dart';
import 'package:weatherapp/utils/utils.dart';
import 'package:weatherapp/widgets/custom_image.dart';

class FavoriteDetail extends StatelessWidget {
  final FavoriteModel favorite;
  const FavoriteDetail({super.key, required this.favorite});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Weather Forecast of ${favorite.name}"),
      ),
      body: ListView(
        children: <Widget>[
          Column(
            children: <Widget>[
              const SizedBox(
                height: 20,
              ),
              Text(
                favorite.name,
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
                "${favorite.region}, ${favorite.country}",
                style: const TextStyle(fontSize: 17),
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                "Updated: ${fullDateAndTime(favorite.lastUpdated)}",
              ),
              CustomImage(
                imageUrl: favorite.conditionIconUrl,
                width: 60,
                height: 60,
              ),
              Text(
                favorite.condition,
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
                        "${favorite.tempC.toString()} °c",
                        style: GoogleFonts.roboto(
                            textStyle: Theme.of(context).textTheme.headline5,
                            color: ConstantUtils.primaryColor),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        "${favorite.tempF.toString()} °f",
                        style: GoogleFonts.roboto(
                            textStyle: Theme.of(context).textTheme.headline5,
                            color: ConstantUtils.primaryColor),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text("Wind: ${favorite.windMph.toString()} mph"),
                      const SizedBox(
                        height: 3,
                      ),
                      Text("Precip: ${favorite.precipIn.toString()} in"),
                      const SizedBox(
                        height: 3,
                      ),
                      Text("Pressure: ${favorite.pressureIn.toString()} in"),
                      const SizedBox(
                        height: 3,
                      ),
                    ],
                  )
                ],
              ),
              FavForecastView(forecastList: favorite.forecastList),
            ],
          )
        ],
      ),
    );
  }
}
