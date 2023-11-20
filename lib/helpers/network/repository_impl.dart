import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:golimo_driver/core/models/driver_order_response/trips_response.dart';
import 'package:golimo_driver/core/models/fuel/get_fuel_histor_response.dart';
import 'package:golimo_driver/core/models/userr_response/login_response.dart';
import 'package:golimo_driver/helpers/network/remote/api_endpoints.dart';
import 'package:golimo_driver/helpers/network/repository.dart';

import 'dio/dio_helper.dart';

class RepoImpl extends Repository {
  final DioHelper dioHelper;

  RepoImpl({
    required this.dioHelper,
  });

  Future<Either<String, T>> _responseHandling<T>({
    required Future<T> Function() onSuccess,
    Future<String> Function(Exception exception)? onOtherError,
  }) async {
    try {
      final f = await onSuccess();
      return Right(f);
    } on SocketException {
      return const Left('Please Check Your Internet Connection');
    } on Exception catch (e) {
      if (onOtherError != null) {
        final f = await onOtherError(e);
        return Left(f.toString());
      }
      final f = onServerErrorBase(e);
      return Left(f.toString());
    }
  }

  @override
  Future<Either<dynamic, DriverLoginResponse>> login({
    required String phone,
    required String password,
  }) async {
    return _responseHandling<DriverLoginResponse>(
      onSuccess: () async {
        final f = await dioHelper.post(
          EndPoints.login,
          data: FormData.fromMap({'phone': '+2$phone', 'password': password}),
        );
        return DriverLoginResponse.fromJson(f.data);
      },
    );
  }

  @override
  Future<Either<dynamic, DriverTripsResponse>> getDriverOrders({required bool isPrevious}) {
    return _responseHandling<DriverTripsResponse>(
      onSuccess: () async {
        final f = await dioHelper.get(
          isPrevious ? EndPoints.previousBooking : EndPoints.upcomingBooking,
        );
        return DriverTripsResponse.fromJson(f.data);
      },
    );
  }

  @override
  Future<Either<dynamic, FuelHistoryResponse>> getFuelHistory() {
    return _responseHandling<FuelHistoryResponse>(
      onSuccess: () async {
        final f = await dioHelper.get(EndPoints.getFuelHistory);
        return FuelHistoryResponse.fromJson(f.data);
      },
    );
  }
}

extension on Repository {
  dynamic onServerErrorBase(dynamic e) {
    if (e is DioError) {
      switch (e.type) {
        case DioErrorType.badResponse:
          Object? msg;
          if (e.response?.data is Map) {
            msg = e.response?.data['error_msg'];
            msg ??= e.response?.data['message'];
          } else {
            msg = e.response?.data;
          }
          return msg ?? e.error;
        case DioErrorType.connectionTimeout:
        case DioErrorType.sendTimeout:
        case DioErrorType.connectionError:
          if (e.error is SocketException) {
            return 'تعذر الإتصال بالخادم، أعد المحاولة لاحقًا';
          }
          return e.message ?? e.error.toString();
        default:
          return e.toString();
      }
    }
    return e.toString();
  }

  Future<Either<String, T>> _responseHandling<T>({
    required Future<T> Function() onSuccess,
    Future<String> Function(Exception exception)? onOtherError,
  }) async {
    try {
      final f = await onSuccess();
      return Right(f);
    } on SocketException {
      return const Left('Please Check Your Internet Connection');
    } on Exception catch (e) {
      if (onOtherError != null) {
        final f = await onOtherError(e);
        return Left(f.toString());
      }
      final f = onServerErrorBase(e);
      return Left(f.toString());
    }
  }
}
