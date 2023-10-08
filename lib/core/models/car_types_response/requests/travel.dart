
class TravelCarTypesRequestModel {
  int sourceCityId;
  int destinationCityId;
  AddressLatLng pickup;
  AddressLatLng dropoff;

  TravelCarTypesRequestModel({
    required this.sourceCityId,
    required this.destinationCityId,
    required this.pickup,
    required this.dropoff,
  });

  factory TravelCarTypesRequestModel.fromJson(Map<String, dynamic> json) => TravelCarTypesRequestModel(
    sourceCityId: json["source_city_id"],
    destinationCityId: json["destination_city_id"],
    pickup: AddressLatLng.fromJson(json["pickup"]),
    dropoff: AddressLatLng.fromJson(json["dropoff"]),
  );

  Map<String, dynamic> toJson() => {
    "source_city_id": sourceCityId,
    "destination_city_id": destinationCityId,
    "pickup": pickup.toJson(),
    "dropoff": dropoff.toJson(),
  };
}

class AddressLatLng {
  double latitude;
  double longitude;

  AddressLatLng({
    required this.latitude,
    required this.longitude,
  });

  factory AddressLatLng.fromJson(Map<String, dynamic> json) => AddressLatLng(
    latitude: json["latitude"],
    longitude: json["longitude"],
  );

  Map<String, dynamic> toJson() => {
    "latitude": '$latitude',
    "longitude": '$longitude',
  };
}
