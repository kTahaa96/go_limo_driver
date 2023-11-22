
class GeneralResponse {
  int status;
  String message;

  GeneralResponse({
    required this.status,
    required this.message,
  });

  factory GeneralResponse.fromJson(Map<String, dynamic> json) => GeneralResponse(
    status: json["status"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
  };
}
