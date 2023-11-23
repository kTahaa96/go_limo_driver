part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class InitialHomeState extends HomeState {}

class LoadingHomeState extends HomeState {}

class ErrorHomeState extends HomeState {}

class SuccessHomeState extends HomeState {}


class ErrorGetLocationState extends HomeState {}

class SuccessGetLocationState extends HomeState {}
