class FavModel {
  final int? id;
  final String name;

  FavModel({this.id, required this.name});

  factory FavModel.fromJson(dynamic data) =>
      FavModel(id: data['id'], name: data['name']);

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
