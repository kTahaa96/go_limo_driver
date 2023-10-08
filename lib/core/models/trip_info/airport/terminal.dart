class TerminalModel {
  int id;
  String name;
  double latitude;
  double longitude;

  TerminalModel({
    required this.id,
    required this.name,
    required this.latitude,
    required this.longitude,
  });

  factory TerminalModel.fromJson(Map<String, dynamic> json) => TerminalModel(
        id: json["id"],
        name: json["name"],
        latitude: json["latitude"].toDouble(),
        longitude: json["longitude"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "latitude": latitude,
        "longitude": longitude,
      };
}
