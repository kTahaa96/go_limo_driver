import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

extension EmptyPadding on num {
  SizedBox get sbH => SizedBox(height: toDouble().h);

  SizedBox get sbW => SizedBox(width: toDouble().h);
}

extension CurrencyFormatExtension on num {
  String toCurrencyFormat() {
    final format = NumberFormat.currency(
      symbol: 'EGP',
      decimalDigits: 0,
      locale: 'en_US',
    ); // You can customize the currency symbol here
    return format.format(this);
  }
}

extension DateHelpers on DateTime {
  bool isToday() {
    final now = DateTime.now();
    return now.day == day && now.month == month && now.year == year;
  }

  bool isTomorrow() {
    final yesterday = DateTime.now().add(const Duration(days: 1));
    return yesterday.day == day && yesterday.month == month && yesterday.year == year;
  }

  String toDateFormat({String? format}) {
    final formatter = DateFormat(format ?? 'EE, d MMM hh:mm');
    return formatter.format(this);
  }
}

extension MapExtension on Map<String, dynamic> {
  Map<String, dynamic> removeNulls() => removeNullsFromMap(this);
}

Map<String, dynamic> removeNullsFromMap(Map<String, dynamic> json) => json
  ..removeWhere((String key, dynamic value) => value == null)
  ..map<String, dynamic>((key, value) => MapEntry(key, removeNulls(value)));

List removeNullsFromList(List list) => list
  ..removeWhere((value) => value == null)
  ..map((e) => removeNulls(e)).toList();

removeNulls(e) =>
    (e is List) ? removeNullsFromList(e) : (e is Map<String, dynamic> ? removeNullsFromMap(e) : e);
