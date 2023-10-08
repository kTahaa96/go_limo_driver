
class AirportCarTypesRequestModel {
  int cityId;
  int airportId;
  int terminalId;
  String latitude;
  String longitude;
  String address;

  AirportCarTypesRequestModel({
    required this.cityId,
    required this.airportId,
    required this.terminalId,
    required this.latitude,
    required this.longitude,
    required this.address,
  });

  factory AirportCarTypesRequestModel.fromJson(Map<String, dynamic> json) => AirportCarTypesRequestModel(
    cityId: json["city_id"],
    airportId: json["airport_id"],
    terminalId: json["terminal_id"],
    latitude: json["latitude"],
    longitude: json["longitude"],
    address: ''
  );

  Map<String, dynamic> toJson() => {
    "city_id": cityId,
    "airport_id": airportId,
    "terminal_id": terminalId,
    "latitude": latitude,
    "longitude": longitude,
  };
}
