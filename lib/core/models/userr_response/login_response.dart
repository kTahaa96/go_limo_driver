import 'package:golimo_driver/core/models/userr_response/user_data.dart';

class LoginResponse {
  LoginResponse({
    this.status,
    this.message,
    this.data,
  });

  int? status;
  String? message;
  UserData? data;


  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      LoginResponse(
          status: json["status"],
          message: json["message"],
          data: json["status"] == null ? null : UserData.fromJson(json["data"]),
      );
}
