class FavouriteModel {
  final int? id;
  final String name;
  final String region;
  final String country;
  final String lastUpdated;
  final String tempC;
  final String windMph;
  final String precipIn;
  final String pressureIn;
  final String tempF;
  final String condition;
  final String conditionIconUrl;

  FavouriteModel({
    this.id,
    required this.name,
    required this.region,
    required this.country,
    required this.lastUpdated,
    required this.tempC,
    required this.windMph,
    required this.precipIn,
    required this.pressureIn,
    required this.tempF,
    required this.condition,
    required this.conditionIconUrl,
  });

  factory FavouriteModel.fromJson(dynamic data) => FavouriteModel(
      id: data['id'],
      name: data['name'],
      region: data['region'],
      country: data['country'],
      lastUpdated: data['lastUpdated'],
      tempC: data['tempC'],
      windMph: data['windMph'],
      precipIn: data['precipIn'],
      pressureIn: data['pressureIn'],
      tempF: data['tempF'],
      condition: data['condition'],
      conditionIconUrl: data['conditionIconUrl']);

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "region": region,
        "country": country,
        "lastUpdated": lastUpdated,
        "tempC": tempC,
        "windMph": windMph,
        "precipIn": precipIn,
        "pressureIn": pressureIn,
        "tempF": tempF,
        "condition": condition,
        "conditionIconUrl": conditionIconUrl,
      };
}
