
class AddressModel {
  String address ;
  double latitude;
  double longitude;


  AddressModel({
    required this.address,
    required this.latitude,
    required this.longitude,
  });

  // factory AddressModel.fromJson(Map<String, dynamic> json) => AddressModel(
  //   address: 'Address',
  //   latitude: json["latitude"],
  //   longitude: json["longitude"],
  // );

  Map<String, dynamic> toJson() => {

    "latitude": '$latitude',
    "longitude": '$longitude',
  };
}