//
// import 'package:golimo_driver/core/models/car_types_response/car_model.dart';
//
// class CarTypesResponse {
//   int status;
//   String message;
//   List<CarModel> data;
//
//   CarTypesResponse({
//     required this.status,
//     required this.message,
//     required this.data,
//   });
//
//   factory CarTypesResponse.fromJson(Map<String, dynamic> json) => CarTypesResponse(
//     status: json["status"],
//     message: json["message"],
//     data: List<CarModel>.from(json["data"].map((x) => CarModel.fromJson(x))),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "status": status,
//     "message": message,
//     "data": List<dynamic>.from(data.map((x) => x.toJson())),
//   };
// }
//
