
class DriversListResponse {
  int status;
  String message;
  List<DriverModel> data;

  DriversListResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  factory DriversListResponse.fromJson(Map<String, dynamic> json) => DriversListResponse(
    status: json["status"],
    message: json["message"],
    data: List<DriverModel>.from(json["data"].map((x) => DriverModel.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class DriverModel {
  int id;
  String fullName;
  String mobile;
  String avatar;
  int approved;

  DriverModel({
    required this.id,
    required this.fullName,
    required this.mobile,
    required this.avatar,
    required this.approved,
  });

  factory DriverModel.fromJson(Map<String, dynamic> json) => DriverModel(
    id: json["id"],
    fullName: json["full_name"],
    mobile: json["mobile"],
    avatar: json["avatar"],
    approved: json["approved"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "full_name": fullName,
    "mobile": mobile,
    "avatar": avatar,
    "approved": approved,
  };
}
