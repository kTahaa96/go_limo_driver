
import 'package:golimo_driver/core/models/userr_response/user_data.dart';

class LoginResponse {
  int status;
  String message;
  UserData data;

  LoginResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
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


