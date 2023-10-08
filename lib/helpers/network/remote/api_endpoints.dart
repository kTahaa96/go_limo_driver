import 'package:flutter_dotenv/flutter_dotenv.dart';

class EndPoints {
  /// Auth
  ///
  static const String login = 'auth/login';
  static const String addPassenger = 'passenger/create';
  static const String sendSms = 'verify/resend-notification';
  static const String verifyCode = 'verify/mobile';
  static const String filterPassenger = 'passenger/filter';
  static const String filterDriver = 'driver/filter';
  static const String getAirportsByCity = 'trip-info/airports';
  static const String getCities = 'trip-info/cities';
  static const String getDropOffCities = 'trip-info/cities?is_travel=1';
  static const String getCityPolygons = 'trip-info/city-polygons';
  static const String getCityPackages = 'trip-info/packages-city-ride-rental';
  static const String getPaymentOptions = 'payment/options';

  static bool get isProduction => dotenv.env['ENV_TYPE'] == 'production';

  static bool get isStaging => dotenv.env['ENV_TYPE'] == 'staging';

  static bool get isDevelopment => dotenv.env['ENV_TYPE'] == 'dev';
}
