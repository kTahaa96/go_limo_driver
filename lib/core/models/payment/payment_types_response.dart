
class PaymentOptionsResponse {
  int status;
  String message;
  List<PaymentOption> data;

  PaymentOptionsResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  factory PaymentOptionsResponse.fromJson(Map<String, dynamic> json) => PaymentOptionsResponse(
    status: json["status"],
    message: json["message"],
    data: List<PaymentOption>.from(json["data"].map((x) => PaymentOption.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class PaymentOption {
  String name;
  bool isSelected ;

  PaymentOption({
    required this.name,
    required this.isSelected
  });

  factory PaymentOption.fromJson(Map<String, dynamic> json) => PaymentOption(
    isSelected: false,
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
  };
}
