
import 'package:golimo_driver/core/models/trip_info/airport/airport_model.dart';
import 'package:golimo_driver/core/models/trip_info/cities/city_model.dart';
import 'package:golimo_driver/core/models/trip_info/cities/polygon_data.dart';

// class AirportTripInformation {
//   int status;
//   String message;
//   List<CityAirportModel> data;
//
//   AirportTripInformation({
//     required this.status,
//     required this.message,
//     required this.data,
//   });
//
//   factory AirportTripInformation.fromJson(Map<String, dynamic> json) => AirportTripInformation(
//     status: json["status"],
//     message: json["message"],
//     data: List<CityAirportModel>.from(json["data"].map((x) => CityAirportModel.fromJson(x))),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "status": status,
//     "message": message,
//     "data": List<dynamic>.from(data.map((x) => x.toJson())),
//   };
// }
//============================================================//
// class CityAirportModel {
//   int id;
//   String nameEn;
//   AirportModel airports;
//
//   CityAirportModel({
//     required this.id,
//     required this.nameEn,
//     required this.airports,
//   });
//
//   factory CityAirportModel.fromJson(Map<String, dynamic> json) => CityAirportModel(
//     id: json["id"],
//     nameEn: json["name_en"],
//     airports: AirportModel.fromJson(json["airports"]),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "id": id,
//     "name_en": nameEn,
//     "airports": airports.toJson(),
//   };
// }

class AirportTripInformation {
  int status;
  String message;
  List<CityModel> data;

  AirportTripInformation({
    required this.status,
    required this.message,
    required this.data,
  });

  factory AirportTripInformation.fromJson(Map<String, dynamic> json) => AirportTripInformation(
    status: json["status"],
    message: json["message"],
    data: List<CityModel>.from(json["data"].map((x) => CityModel.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

// class CityAirportModel {
//   int id;
//   String nameEn;
//   Polygon polygon;
//   List<AirportModel> airports;
//
//   CityAirportModel({
//     required this.id,
//     required this.nameEn,
//     required this.polygon,
//     required this.airports,
//   });
//
//   factory CityAirportModel.fromJson(Map<String, dynamic> json) => CityAirportModel(
//     id: json["id"],
//     nameEn: json["name_en"],
//     polygon: Polygon.fromJson(json["polygon"]),
//     airports: List<AirportModel>.from(json["airports"].map((x) => AirportModel.fromJson(x))),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "id": id,
//     "name_en": nameEn,
//     "polygon": polygon.toJson(),
//     "airports": List<dynamic>.from(airports.map((x) => x.toJson())),
//   };
// }
//
// class Airport {
//   int id;
//   String nameEn;
//   List<dynamic> polygon;
//   List<Terminal> terminals;
//
//   Airport({
//     required this.id,
//     required this.nameEn,
//     required this.polygon,
//     required this.terminals,
//   });
//
//   factory Airport.fromJson(Map<String, dynamic> json) => Airport(
//     id: json["id"],
//     nameEn: json["name_en"],
//     polygon: List<dynamic>.from(json["polygon"].map((x) => x)),
//     terminals: List<Terminal>.from(json["terminals"].map((x) => Terminal.fromJson(x))),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "id": id,
//     "name_en": nameEn,
//     "polygon": List<dynamic>.from(polygon.map((x) => x)),
//     "terminals": List<dynamic>.from(terminals.map((x) => x.toJson())),
//   };
// }
//
// class Terminal {
//   int id;
//   String name;
//   double latitude;
//   double longitude;
//
//   Terminal({
//     required this.id,
//     required this.name,
//     required this.latitude,
//     required this.longitude,
//   });
//
//   factory Terminal.fromJson(Map<String, dynamic> json) => Terminal(
//     id: json["id"],
//     name: json["name"],
//     latitude: json["latitude"].toDouble(),
//     longitude: json["longitude"].toDouble(),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "id": id,
//     "name": name,
//     "latitude": latitude,
//     "longitude": longitude,
//   };
// }
//
// class Polygon {
//   NorthEast northEast;
//   NorthEast southWest;
//
//   Polygon({
//     required this.northEast,
//     required this.southWest,
//   });
//
//   factory Polygon.fromJson(Map<String, dynamic> json) => Polygon(
//     northEast: NorthEast.fromJson(json["north_east"]),
//     southWest: NorthEast.fromJson(json["south_west"]),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "north_east": northEast.toJson(),
//     "south_west": southWest.toJson(),
//   };
// }
//
// class NorthEast {
//   double latitude;
//   double longitude;
//
//   NorthEast({
//     required this.latitude,
//     required this.longitude,
//   });
//
//   factory NorthEast.fromJson(Map<String, dynamic> json) => NorthEast(
//     latitude: json["latitude"].toDouble(),
//     longitude: json["longitude"].toDouble(),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "latitude": latitude,
//     "longitude": longitude,
//   };
// }


