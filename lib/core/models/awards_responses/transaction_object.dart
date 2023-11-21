
import 'package:intl/intl.dart';

class TransactionsResponse {
  int status;
  String message;
  List<Datum> data;
  Pagination pagination;
  Meta meta;

  TransactionsResponse({
    required this.status,
    required this.message,
    required this.data,
    required this.pagination,
    required this.meta,
  });

  factory TransactionsResponse.fromJson(Map<String, dynamic> json) => TransactionsResponse(
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
  int transactionType;
  int amount;
  String type;
  int balance;
  String title;
  DateTime createdAt;

  Datum({
    required this.id,
    required this.transactionType,
    required this.amount,
    required this.type,
    required this.balance,
    required this.title,
    required this.createdAt,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    transactionType: json["transaction_type"],
    amount: json["amount"],
    type: json["type"],
    balance: json["balance"],
    title: json["title"],
    createdAt: DateFormat("yyyy-MM-dd hh:mm").parse(json["created_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "transaction_type": transactionType,
    "amount": amount,
    "type": type,
    "balance": balance,
    "title": title,
    "created_at": createdAt,
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
