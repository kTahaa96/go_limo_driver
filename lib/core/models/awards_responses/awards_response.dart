
import 'package:intl/intl.dart';

class AwardsResponse {
  int status;
  String message;
  List<Datum> data;
  Pagination pagination;
  Meta meta;

  AwardsResponse({
    required this.status,
    required this.message,
    required this.data,
    required this.pagination,
    required this.meta,
  });

  factory AwardsResponse.fromJson(Map<String, dynamic> json) => AwardsResponse(
    status: json["status"],
    message: json["message"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    pagination: Pagination.fromJson(json["pagination"]),
    meta: Meta.fromJson(json["meta"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "pagination": pagination.toJson(),
    "meta": meta.toJson(),
  };
}

class Datum {
  int id;
  int status;
  String description;
  DateTime createdAt;
  Award award;

  Datum({
    required this.id,
    required this.status,
    required this.description,
    required this.createdAt,
    required this.award,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    status: json["status"],
    description: json["description"]??'',
    createdAt: DateFormat("yyyy-MM-dd hh:mm").parse(json["created_at"]),
    award: Award.fromJson(json["award"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "status": status,
    "description": description,
    "created_at": createdAt,
    "award": award.toJson(),
  };
}

class Award {
  int id;
  String name;
  String description;

  Award({
    required this.id,
    required this.name,
    required this.description,
  });

  factory Award.fromJson(Map<String, dynamic> json) => Award(
    id: json["id"],
    name: json["name"],
    description: json["description"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "description": description,
  };
}

class Meta {
  int wallet;
  int totalTransactions;

  Meta({
    required this.wallet,
    required this.totalTransactions,
  });

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
    wallet: json["wallet"],
    totalTransactions: json["total_transactions"],
  );

  Map<String, dynamic> toJson() => {
    "wallet": wallet,
    "total_transactions": totalTransactions,
  };
}

class Pagination {
  int total;
  int perPage;
  int currentPage;
  int lastPage;
  int from;
  int to;

  Pagination({
    required this.total,
    required this.perPage,
    required this.currentPage,
    required this.lastPage,
    required this.from,
    required this.to,
  });

  factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
    total: json["total"],
    perPage: json["per_page"],
    currentPage: json["current_page"],
    lastPage: json["last_page"],
    from: json["from"],
    to: json["to"],
  );

  Map<String, dynamic> toJson() => {
    "total": total,
    "per_page": perPage,
    "current_page": currentPage,
    "last_page": lastPage,
    "from": from,
    "to": to,
  };
}
