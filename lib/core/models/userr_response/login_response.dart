
import 'package:golimo_driver/core/models/userr_response/user_data.dart';

class DriverLoginResponse {
  int status;
  String message;
  UserData data;

  DriverLoginResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  factory DriverLoginResponse.fromJson(Map<String, dynamic> json) => DriverLoginResponse(
    status: json["status"],
    message: json["message"],
    data: UserData.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data.toJson(),
  };
}


