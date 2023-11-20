import 'package:dartz/dartz.dart';
import 'package:golimo_driver/core/models/userr_response/login_response.dart';

abstract class Repository {
  Future<Either<dynamic, LoginResponse>> login({
    required String phone,
    required String password,
  });
}
