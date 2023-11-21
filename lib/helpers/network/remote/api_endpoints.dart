import 'package:flutter_dotenv/flutter_dotenv.dart';

class EndPoints {
  /// Auth
  ///
  static const String login = 'auth/login';
  static const String upcomingBooking = 'trips/upcoming';
  static const String previousBooking = 'trips/previous';
  static const String getFuelHistory = 'fuel';
  static const String getTransactions = 'incentives/transactions';
  static const String getAwards = 'incentives/awards';


  static bool get isProduction => dotenv.env['ENV_TYPE'] == 'production';

  static bool get isStaging => dotenv.env['ENV_TYPE'] == 'staging';

  static bool get isDevelopment => dotenv.env['ENV_TYPE'] == 'dev';
}
