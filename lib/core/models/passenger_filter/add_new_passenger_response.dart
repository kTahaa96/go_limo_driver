class AddPassengerResponse {
  int status;
  String message;
  NewPassengerDetails data;

  AddPassengerResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  factory AddPassengerResponse.fromJson(Map<String, dynamic> json) => AddPassengerResponse(
        status: json["status"],
        message: json["message"],
        data: NewPassengerDetails.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data.toJson(),
      };
}

class NewPassengerDetails {
  int id;
  String fullName;
  String email;
  String mobile;
  String? avatar;

  NewPassengerDetails({
    required this.id,
    required this.fullName,
    required this.email,
    required this.mobile,
    this.avatar,
  });

  factory NewPassengerDetails.fromJson(Map<String, dynamic> json) => NewPassengerDetails(
        id: json["id"],
        fullName: json["full_name"],
        email: json["email"],
        mobile: json["mobile"]??'',
        avatar: json["avatar"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "full_name": fullName,
        "email": email,
        "mobile": mobile,
        "avatar": avatar,
      };
}
