import 'package:golimo_driver/core/models/driver_order_response/driver_trips_item_model.dart';
import 'package:golimo_driver/core/models/home_module/notification_item.dart';

class HomeModuleResponse {
  int status;
  String message;
  Data data;

  HomeModuleResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  factory HomeModuleResponse.fromJson(Map<String, dynamic> json) => HomeModuleResponse(
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
  List<TripItemModel> ongoingTrips;
  List<TripItemModel> todayTrips;
  List<NotificationModel> notifications;

  Data({
    required this.ongoingTrips,
    required this.todayTrips,
    required this.notifications,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        ongoingTrips: json["ongoing_trip"] == null
            ? []
            : List<TripItemModel>.from(json["ongoing_trip"].map((x) => TripItemModel.fromJson(x))),
        todayTrips:
            List<TripItemModel>.from(json["today_trips"].map((x) => TripItemModel.fromJson(x))),
        notifications: List<NotificationModel>.from(
            json["notifications"].map((x) => NotificationModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "ongoing_trip": List<dynamic>.from(todayTrips.map((x) => x.toJson())),
        "today_trips": List<dynamic>.from(todayTrips.map((x) => x.toJson())),
        "notifications": List<dynamic>.from(notifications.map((x) => x.toJson())),
      };
}
