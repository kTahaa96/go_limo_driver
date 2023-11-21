import 'package:intl/intl.dart';

class HistoryItem {
  int id;
  int type;
  int amount;
  int litersNo;
  int kilometersBefore;
  int kilometersAfter;
  String meterImageBefore;
  String meterImageAfter;
  String receiptImage;
  DateTime createdAt;

  HistoryItem({
    required this.id,
    required this.type,
    required this.amount,
    required this.litersNo,
    required this.kilometersBefore,
    required this.kilometersAfter,
    required this.meterImageBefore,
    required this.meterImageAfter,
    required this.receiptImage,
    required this.createdAt,
  });

  factory HistoryItem.fromJson(Map<String, dynamic> json) => HistoryItem(
    id: json["id"],
    type: json["type"],
    amount: json["amount"],
    litersNo: json["liters_no"],
    kilometersBefore: json["kilometers_before"],
    kilometersAfter: json["kilometers_after"],
    meterImageBefore: json["meter_image_before"],
    meterImageAfter: json["meter_image_after"],
    receiptImage: json["receipt_image"],
    createdAt: DateFormat("yyyy-MM-dd hh:mm").parse(json["created_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "type": type,
    "amount": amount,
    "liters_no": litersNo,
    "kilometers_before": kilometersBefore,
    "kilometers_after": kilometersAfter,
    "meter_image_before": meterImageBefore,
    "meter_image_after": meterImageAfter,
    "receipt_image": receiptImage,
    "created_at": createdAt,
  };
}
