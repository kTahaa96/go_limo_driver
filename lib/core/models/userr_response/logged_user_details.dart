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
