//
// import 'package:golimo_driver/core/models/home_module/home_passenger_model.dart';
//
// class HomeTrip {
//   int id;
//   String pickupFrom;
//   DateTime pickupDateTime;
//   String dropToFrom;
//   int? remainingMinutes;
//   HomePassenger passenger;
//
//   HomeTrip({
//     required this.id,
//     required this.pickupFrom,
//     required this.pickupDateTime,
//     required this.dropToFrom,
//     this.remainingMinutes,
//     required this.passenger,
//   });
//
//   factory HomeTrip.fromJson(Map<String, dynamic> json) => HomeTrip(
//     id: json["id"],
//     pickupFrom: json["pickup_from"],
//     pickupDateTime: DateTime.parse(json["pickup_date_time"]),
//     dropToFrom: json["drop_to_from"],
//     remainingMinutes: json["remaining_minutes"],
//     passenger: HomePassenger.fromJson(json["passenger"]),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "id": id,
//     "pickup_from": pickupFrom,
//     "pickup_date_time": pickupDateTime.toIso8601String(),
//     "drop_to_from": dropToFrom,
//     "remaining_minutes": remainingMinutes,
//     "passenger": passenger.toJson(),
//   };
// }
