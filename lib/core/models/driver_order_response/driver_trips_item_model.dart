class TripItemModel {
  int id;
  String pickupFrom;
  DateTime pickupDateTime;
  String dropToFrom;
  int? remainingMinutes;
  Passenger passenger;

  TripItemModel(
      {required this.id,
      required this.pickupFrom,
      required this.pickupDateTime,
      required this.dropToFrom,
      required this.passenger,
      this.remainingMinutes});

  factory TripItemModel.fromJson(Map<String, dynamic> json) => TripItemModel(
        id: json["id"],
        pickupFrom: json["pickup_from"],
        remainingMinutes: json["remaining_minutes"],
        pickupDateTime: DateTime.parse(json["pickup_date_time"]),
        dropToFrom: json["drop_to_from"],
        passenger: Passenger.fromJson(json["passenger"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "pickup_from": pickupFrom,
        "pickup_date_time": pickupDateTime.toIso8601String(),
        "drop_to_from": dropToFrom,
        "passenger": passenger.toJson(),
      };
}

class Passenger {
  int id;
  dynamic email;
  String mobile;
  String fullName;
  String avatar;
  bool verified;

  Passenger({
    required this.id,
    required this.email,
    required this.mobile,
    required this.fullName,
    required this.avatar,
    required this.verified,
  });

  factory Passenger.fromJson(Map<String, dynamic> json) => Passenger(
        id: json["id"],
        email: json["email"],
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
