
class RentalCarTypesRequestModel {
  int cityId;
  int packageId;


  RentalCarTypesRequestModel({
    required this.cityId,
    required this.packageId,

  });

  factory RentalCarTypesRequestModel.fromJson(Map<String, dynamic> json) => RentalCarTypesRequestModel(
    cityId: json["city_id"],
    packageId: json["package_id"],

  );

  Map<String, dynamic> toJson() => {
    "city_id": cityId,
    "package_id": packageId,
  };
}
