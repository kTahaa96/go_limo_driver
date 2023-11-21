part of 'home_lay_out_cubit.dart';

@immutable
abstract class HomeLayOutState {}

class InitialHomeLayoutState extends HomeLayOutState {}
class SuccessHomeDataState extends HomeLayOutState {}
class LoadingHomeDataState extends HomeLayOutState {}
class UpdatePageIndexState extends HomeLayOutState {}
