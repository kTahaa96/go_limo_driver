import 'package:golimo_driver/core/models/trip_info/airport/terminal.dart';

class AirportModel {
  int id;
  String nameEn;
  List<dynamic> polygon;
  List<TerminalModel> terminals;

  AirportModel({
    required this.id,
    required this.nameEn,
    required this.polygon,
    required this.terminals,
  });

  factory AirportModel.fromJson(Map<String, dynamic> json) => AirportModel(
    id: json["id"],
    nameEn: json["name_en"],
    polygon: List<dynamic>.from(json["polygon"].map((x) => x)),
    terminals: List<TerminalModel>.from(json["terminals"].map((x) => TerminalModel.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name_en": nameEn,
    "polygon": List<dynamic>.from(polygon.map((x) => x)),
    "terminals": List<dynamic>.from(terminals.map((x) => x.toJson())),
  };
}
