import 'package:golimo_driver/core/models/userr_response/logged_user_details.dart';

class UserData {
  UserData({
    this.token,
    required this.passenger,
  });

  String? token;
  LoggedUserDetails passenger;

  factory UserData.fromJson(Map<String, dynamic> json) => UserData(
        token: json["token"],
        passenger: LoggedUserDetails.fromJson(json["driver"]),
      );

  Map<String, dynamic> toJson() => {
        "token": token,
        "user": passenger.toJson(),
      };
}
