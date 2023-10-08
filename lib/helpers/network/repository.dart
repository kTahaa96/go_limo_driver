import 'package:dartz/dartz.dart';
import 'package:golimo_driver/core/models/car_types_response/car_types_response.dart';
import 'package:golimo_driver/core/models/drivers_fliter/drivers_filters_response.dart';
import 'package:golimo_driver/core/models/passenger_filter/add_new_passenger_response.dart';
import 'package:golimo_driver/core/models/passenger_filter/passenger_filter_response.dart';
import 'package:golimo_driver/core/models/payment/payment_types_response.dart';
import 'package:golimo_driver/core/models/trip_info/airport/airport_trip_information.dart';
import 'package:golimo_driver/core/models/trip_info/cities/cities_response.dart';
import 'package:golimo_driver/core/models/trip_info/cities/city_polygons_response.dart';
import 'package:golimo_driver/core/models/trip_info/rental/packages.dart';
import 'package:golimo_driver/core/models/userr_response/login_response.dart';

abstract class Repository {
  Future<Either<dynamic, LoginResponse>> login({
    required String userName,
    required String password,
  });

}
