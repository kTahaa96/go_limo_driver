
class Polygon {
  NorthEast northEast;
  NorthEast southWest;

  Polygon({
    required this.northEast,
    required this.southWest,
  });

  factory Polygon.fromJson(Map<String, dynamic> json) => Polygon(
    northEast: NorthEast.fromJson(json["north_east"]),
    southWest: NorthEast.fromJson(json["south_west"]),
  );

  Map<String, dynamic> toJson() => {
    "north_east": northEast.toJson(),
    "south_west": southWest.toJson(),
  };
}

class NorthEast {
  double latitude;
  double longitude;

  NorthEast({
    required this.latitude,
    required this.longitude,
  });

  factory NorthEast.fromJson(Map<String, dynamic> json) => NorthEast(
    latitude: json["latitude"].toDouble(),
    longitude: json["longitude"].toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "latitude": latitude,
    "longitude": longitude,
  };
}
