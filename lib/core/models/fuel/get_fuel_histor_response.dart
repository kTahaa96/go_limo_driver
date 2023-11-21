import 'package:golimo_driver/core/models/fuel/history_item_model.dart';

class FuelHistoryResponse {
  int status;
  String message;
  List<HistoryItem> data;

  FuelHistoryResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  factory FuelHistoryResponse.fromJson(Map<String, dynamic> json) => FuelHistoryResponse(
        status: json["status"],
        message: json["message"],
        data: List<HistoryItem>.from(json["data"].map((x) => HistoryItem.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}
