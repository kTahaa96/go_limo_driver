
import 'package:golimo_driver/core/models/trip_info/cities/city_model.dart';

class CitiesResponse {
  int status;
  String message;
  List<CityModel> data;

  CitiesResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  factory CitiesResponse.fromJson(Map<String, dynamic> json) => CitiesResponse(
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

