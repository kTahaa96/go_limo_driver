import 'package:golimo_driver/core/models/trip_info/airport/airport_model.dart';
import 'package:golimo_driver/core/models/trip_info/cities/polygon_data.dart';

class CityModel {
  int id;
  String nameEn;
  String? defaultService;
  Polygon polygon;
  List<AirportModel>? airports;

  CityModel({
    required this.id,
    required this.nameEn,
    this.defaultService,
    this.airports,
    required this.polygon,
  });

  factory CityModel.fromJson(Map<String, dynamic> json) => CityModel(
        id: json["id"],
        nameEn: json["name_en"],
        defaultService: json["default_service"],
        polygon: Polygon.fromJson(json["polygon"]),
        airports: json["airports"] == null
            ? null
            : List<AirportModel>.from(json["airports"].map((x) => AirportModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name_en": nameEn,
        "default_service": defaultService,
        "polygon": polygon.toJson(),
      };
}
