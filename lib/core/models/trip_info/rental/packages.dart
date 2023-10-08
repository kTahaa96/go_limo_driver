
class RentalPackagesResponse {
  int status;
  String message;
  Data data;

  RentalPackagesResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  factory RentalPackagesResponse.fromJson(Map<String, dynamic> json) => RentalPackagesResponse(
    status: json["status"],
    message: json["message"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data.toJson(),
  };
}

class Data {
  List<PackageModel> packages;

  Data({
    required this.packages,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    packages: List<PackageModel>.from(json["packages"].map((x) => PackageModel.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "packages": List<dynamic>.from(packages.map((x) => x.toJson())),
  };
}

class PackageModel {
  int id;
  String packageName;
  String description;
  int priceInt;
  String tripPrice;
  String currency;
  int extraHour;

  PackageModel({
    required this.id,
    required this.packageName,
    required this.description,
    required this.priceInt,
    required this.tripPrice,
    required this.currency,
    required this.extraHour,
  });

  factory PackageModel.fromJson(Map<String, dynamic> json) => PackageModel(
    id: json["id"],
    packageName: json["package_name"],
    description: json["description"],
    priceInt: json["price_int"],
    tripPrice: json["trip_price"],
    currency: json["currency"],
    extraHour: json["extra_hour"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "package_name": packageName,
    "description": description,
    "price_int": priceInt,
    "trip_price": tripPrice,
    "currency": currency,
    "extra_hour": extraHour,
  };
}
