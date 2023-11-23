import 'package:intl/intl.dart';

class NotificationModel {
  String id;
  int type;
  String name;
  String description;
  int remaining;
  bool read;
  DateTime createdAt;

  NotificationModel({
    required this.id,
    required this.type,
    required this.name,
    required this.description,
    required this.remaining,
    required this.read,
    required this.createdAt,
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json) => NotificationModel(
        id: json["id"],
        type: json["type"],
        name: json["name"],
        description: json["description"],
        remaining: json["remaining"] ?? 0,
        read: json["read"],
        createdAt: DateFormat("yyyy-MM-dd hh:mm").parse(json["created_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "type": type,
        "name": name,
        "description": description,
        "remaining": remaining,
        "read": read,
        "created_at": createdAt,
      };
}
