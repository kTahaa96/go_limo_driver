class CarModel {
  int idCarType;
  String image;
  String nameEn;
  int tripPriceInt;
  String tripPrice;
  double duration;
  int kilometers;

  CarModel({
    required this.idCarType,
    required this.image,
    required this.nameEn,
    required this.tripPriceInt,
    required this.tripPrice,
    required this.duration,
    required this.kilometers,
  });

  factory CarModel.fromJson(Map<String, dynamic> json) => CarModel(
    idCarType: json["id_car_type"],
    image: json["image"],
    nameEn: json["name_en"],
    tripPriceInt: json["trip_price_int"],
    tripPrice: '${json["trip_price"]}',
    duration: json["duration"].toDouble(),
    kilometers: json["kilometers"],
  );

  Map<String, dynamic> toJson() => {
    "id_car_type": idCarType,
    "image": image,
    "name_en": nameEn,
    "trip_price_int": tripPriceInt,
    "trip_price": tripPrice,
    "duration": duration,
    "kilometers": kilometers,
  };
}
