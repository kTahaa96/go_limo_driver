import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:golimo_driver/core/models/userr_response/login_response.dart';
import 'package:golimo_driver/core/models/userr_response/user_data.dart';
import 'package:golimo_driver/helpers/local/user_preferences/user_preferences_helper.dart';
import 'package:golimo_driver/helpers/network/repository.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final Repository repository;

  LoginCubit({required this.repository}) : super(InitialLoginState());

  static LoginCubit of(context) => BlocProvider.of(context);

  void saveUserDate(UserData userModel) {
    UserPreferencesHelper().saveUserPreference(userData: userModel);
  }

  Future<void> login({required String email, required String password}) async {
    emit(LoadingLoginState());
    final f = await repository.login(userName: email.trim(), password: password.trim());
    f.fold((l) {
      emit(ErrorLoginState(message: l.toString()));
    }, (r) {
      LoginResponse response = r;
      saveUserDate(response.data!);
    });
  }

}
