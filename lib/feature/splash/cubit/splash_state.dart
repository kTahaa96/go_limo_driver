part of 'splash_cubit.dart';

@immutable
abstract class SplashState {}

class InitialSplashState extends SplashState {}
class UnAuthenticatedState extends SplashState {}
class AuthenticatedState extends SplashState {}
