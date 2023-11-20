class LoggedUserDetails {
  LoggedUserDetails({
    required this.email,
    required this.mobile,
    required this.fullName,
  });

  String email;
  String mobile;
  String fullName;

  factory LoggedUserDetails.fromJson(Map<String, dynamic> json) => LoggedUserDetails(
        email: json["email"] ?? '',
        mobile: json["mobile"] ?? "",
        fullName: json["full_name"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "mobile": mobile,
        "full_name": fullName,
      };
}
