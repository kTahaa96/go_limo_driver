import 'package:flutter/material.dart';
import 'package:golimo_driver/feature/home_page/home_layout.dart';
import 'package:golimo_driver/feature/login/login.dart';
import 'package:golimo_driver/helpers/navigator/named-navigator_routes.dart';

import '../../feature/splash/splash_screen.dart';

class NamedNavigatorImpl {
  static final GlobalKey<NavigatorState> navigatorState = GlobalKey<NavigatorState>();

  static Route<dynamic> onGenerateRoute(RouteSettings? settings) {
    switch (settings!.name) {
      case Routes.splashScreen:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case Routes.login:
        return MaterialPageRoute(builder: (_) => const LoginScreen());

      case Routes.homePage:
        return MaterialPageRoute(builder: (_) => const HomePage());
    }

    /// not_found_view
    return MaterialPageRoute(builder: (_) => Container());
  }

  static void pop({dynamic result}) {
    if (Navigator.of(navigatorState.currentState!.context).canPop()) {
      Navigator.of(navigatorState.currentState!.context).pop(result);
    }
  }

  static Future push(String routeName, {arguments, bool replace = false, bool clean = false}) {
    if (clean) {
      return navigatorState.currentState!
          .pushNamedAndRemoveUntil(routeName, (_) => false, arguments: arguments);
    } else if (replace) {
      return navigatorState.currentState!.pushReplacementNamed(routeName, arguments: arguments);
    } else {
      return navigatorState.currentState!.pushNamed(routeName, arguments: arguments);
    }
  }
}
