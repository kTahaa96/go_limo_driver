import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:golimo_driver/helpers/local/user_preferences/user_preferences_helper.dart';
import 'package:golimo_driver/helpers/network/extensions/cubit_extension.dart';

import 'state.dart';

class NetworkCubit extends Cubit<NetworkStates> {
  NetworkCubit() : super(NoErrorState());

  static NetworkCubit get(BuildContext context) => BlocProvider.of(context);

  Future<Map<String, dynamic>> onRequestCallback() async {
    String? token = UserPreferencesHelper().getUserTokenPreference();
    return {
      "Authorization": "Bearer $token",
    };
  }

  Future<void> onErrorCallback(DioError error) async {
    final response = error.response;
    if (response != null) {
      if ((response.statusCode == 500 && response.data['message'].toString().contains('Unauthenticated') ||
          response.statusCode == 401)) {
        safeEmit(
          UnauthenticatedState(
            "you are logged out please login again",
          ),
        );
      } else {
        safeEmit(
          ErrorState(
            response.data['message'] ?? "Something went wrong try again later",
          ),
        );
      }
    }
  }
}
