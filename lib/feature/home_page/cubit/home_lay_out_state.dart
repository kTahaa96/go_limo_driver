part of 'home_lay_out_cubit.dart';

@immutable
abstract class HomeLayOutState {}

class InitialHomeLayoutState extends HomeLayOutState {}
class SuccessGetHomeDataState extends HomeLayOutState {}
class LoadingGetHomeDataState extends HomeLayOutState {}
class UpdatePageIndexState extends HomeLayOutState {}
