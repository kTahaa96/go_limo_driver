import 'package:image_picker/image_picker.dart';

class FuelApiRequestModel {
  int type;
  int amount;
  int litersNo;
  int kilometersBefore;
  int kilometersAfter;
  XFile meterImageBefore;
  XFile meterImageAfter;
  XFile receiptImage;

  FuelApiRequestModel({
    required this.type,
    required this.amount,
    required this.litersNo,
    required this.kilometersBefore,
    required this.kilometersAfter,
    required this.meterImageBefore,
    required this.meterImageAfter,
    required this.receiptImage,
  });

  factory FuelApiRequestModel.fromJson(Map<String, dynamic> json) => FuelApiRequestModel(
        type: json["type"],
        amount: json["amount"],
        litersNo: json["liters_no"],
        kilometersBefore: json["kilometers_before"],
        kilometersAfter: json["kilometers_after"],
        meterImageBefore: json["meter_image_before"],
        meterImageAfter: json["meter_image_after"],
        receiptImage: json["receipt_image"],
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "amount": amount,
        "liters_no": litersNo,
        "kilometers_before": kilometersBefore,
        "kilometers_after": kilometersAfter,
        "meter_image_before": meterImageBefore,
        "meter_image_after": meterImageAfter,
        "receipt_image": receiptImage,
      };
}
