class UserData {
  String token;
  Driver driver;

  UserData({
    required this.token,
    required this.driver,
  });

  factory UserData.fromJson(Map<String, dynamic> json) => UserData(
    token: json["token"],
    driver: Driver.fromJson(json["driver"]),
  );

  Map<String, dynamic> toJson() => {
    "token": token,
    "driver": driver.toJson(),
  };
}

class Driver {
  int id;
  String mobile;
  String fullName;
  String avatar;

  Driver({
    required this.id,
    required this.mobile,
    required this.fullName,
    required this.avatar,
  });

  factory Driver.fromJson(Map<String, dynamic> json) => Driver(
    id: json["id"],
    mobile: json["mobile"],
    fullName: json["full_name"],
    avatar: json["avatar"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "mobile": mobile,
    "full_name": fullName,
    "avatar": avatar,
  };
}
