part of 'login_cubit.dart';

@immutable
abstract class LoginState {}

class InitialLoginState extends LoginState {}

class ErrorLoginState extends LoginState {
  final String message;

  ErrorLoginState({required this.message});
}

class LoadingLoginState extends LoginState {}

class SuccessLoginState extends LoginState {
  final String mobile;

  SuccessLoginState({required this.mobile});
}


class ErrorSendSmsState extends LoginState {
  final String message ;

  ErrorSendSmsState(this.message);
}

class LoadingSendSmsState extends LoginState {}

class SuccessSendSmsState extends LoginState {
  final String phoneNumber ;

  SuccessSendSmsState(this.phoneNumber);
}
