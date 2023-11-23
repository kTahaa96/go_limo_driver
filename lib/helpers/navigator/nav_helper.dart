import 'package:flutter/material.dart';

class Nav {
  static void replace(Widget widget, BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (ctx) => widget,
      ),
    );
  }

  static void to(Widget widget, BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (ctx) => widget,
      ),
    );
  }

  static void replaceAll(Widget widget, BuildContext context) {
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => widget),
          (Route<dynamic> route) => false,
    );
  }
}
