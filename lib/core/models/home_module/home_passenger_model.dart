class HomePassenger {
  int id;
  String email;
  String mobile;
  String fullName;
  String avatar;
  bool verified;

  HomePassenger({
    required this.id,
    required this.email,
    required this.mobile,
    required this.fullName,
    required this.avatar,
    required this.verified,
  });

  factory HomePassenger.fromJson(Map<String, dynamic> json) => HomePassenger(
        id: json["id"],
        email: json["email"] ?? '',
        mobile: json["mobile"],
        fullName: json["full_name"],
        avatar: json["avatar"],
        verified: json["verified"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "mobile": mobile,
        "full_name": fullName,
        "avatar": avatar,
        "verified": verified,
      };
}
