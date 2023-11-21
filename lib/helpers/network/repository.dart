import 'package:dartz/dartz.dart';
import 'package:golimo_driver/core/models/driver_order_response/trips_response.dart';
import 'package:golimo_driver/core/models/fuel/get_fuel_histor_response.dart';
import 'package:golimo_driver/core/models/fuel/history_item_model.dart';
import 'package:golimo_driver/core/models/general_response.dart';
import 'package:golimo_driver/core/models/userr_response/login_response.dart';

import '../../core/models/fuel/fuel_request_model.dart';

abstract class Repository {
  Future<Either<dynamic, DriverLoginResponse>> login({
    required String phone,
    required String password,
  });

  Future<Either<dynamic, DriverTripsResponse>> getDriverOrders({required bool isPrevious});

  Future<Either<dynamic, FuelHistoryResponse>> getFuelHistory();
  Future<Either<dynamic, GeneralResponse>> addFuel({required FuelApiRequestModel requestModel});
}
