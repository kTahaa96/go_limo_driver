
class CityPolygonsResponse {
  int status;
  String message;
  Data data;

  CityPolygonsResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  factory CityPolygonsResponse.fromJson(Map<String, dynamic> json) => CityPolygonsResponse(
    status: json["status"],
    message: json["message"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data.toJson(),
  };
}

class Data {
  int id;
  String nameEn;
  CenterLocation centerLocation;
  Polygons polygons;

  Data({
    required this.id,
    required this.nameEn,
    required this.centerLocation,
    required this.polygons,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    nameEn: json["name_en"],
    centerLocation: CenterLocation.fromJson(json["center_location"]),
    polygons: Polygons.fromJson(json["polygons"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name_en": nameEn,
    "center_location": centerLocation.toJson(),
    "polygons": polygons.toJson(),
  };
}

class CenterLocation {
  double longitude;
  double latitude;

  CenterLocation({
    required this.longitude,
    required this.latitude,
  });

  factory CenterLocation.fromJson(Map<String, dynamic> json) => CenterLocation(
    longitude: json["longitude"].toDouble(),
    latitude: json["latitude"].toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "longitude": longitude,
    "latitude": latitude,
  };
}

class Polygons {
  CenterLocation northEast;
  CenterLocation southWest;

  Polygons({
    required this.northEast,
    required this.southWest,
  });

  factory Polygons.fromJson(Map<String, dynamic> json) => Polygons(
    northEast: CenterLocation.fromJson(json["north_east"]),
    southWest: CenterLocation.fromJson(json["south_west"]),
  );

  Map<String, dynamic> toJson() => {
    "north_east": northEast.toJson(),
    "south_west": southWest.toJson(),
  };
}
