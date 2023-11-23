part of 'home_cubit.dart';

@immutable
abstract class HomeStates {}

class InitialHomeState extends HomeStates {}

class LoadingHomeState extends HomeStates {}

class ErrorHomeState extends HomeStates {}

class SuccessHomeState extends HomeStates {}


class ErrorGetLocationState extends HomeStates {}

class SuccessGetLocationState extends HomeStates {}
