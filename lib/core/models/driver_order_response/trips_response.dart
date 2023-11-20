
import 'package:golimo_driver/core/models/driver_order_response/driver_trips_item_model.dart';

class DriverTripsResponse {
  int status;
  String message;
  List<TripItemModel> data;

  DriverTripsResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  factory DriverTripsResponse.fromJson(Map<String, dynamic> json) => DriverTripsResponse(
    status: json["status"],
    message: json["message"],
    data: List<TripItemModel>.from(json["data"].map((x) => TripItemModel.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}
