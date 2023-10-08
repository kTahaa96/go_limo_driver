import 'package:golimo_driver/core/models/passenger_filter/add_new_passenger_response.dart';

class PassengerFilterResponse {
  int status;
  String message;
  List<NewPassengerDetails> data;

  PassengerFilterResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  factory PassengerFilterResponse.fromJson(Map<String, dynamic> json) => PassengerFilterResponse(
        status: json["status"],
        message: json["message"],
        data: List<NewPassengerDetails>.from(json["data"].map((x) => NewPassengerDetails.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

// class PassengerData {
//   int id;
//   String fullName;
//   String email;
//   String mobile;
//   String? avatar;
//
//   PassengerData({
//     required this.id,
//     required this.fullName,
//     required this.email,
//     required this.mobile,
//     required this.avatar,
//   });
//
//   factory PassengerData.fromJson(Map<String, dynamic> json) => PassengerData(
//         id: json["id"],
//         fullName: json["full_name"],
//         email: json["email"],
//         mobile: json["mobile"],
//         avatar: json["avatar"] ?? "",
//       );
//
//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "full_name": fullName,
//         "email": email,
//         "mobile": mobile,
//         "avatar": avatar,
//       };
// }
