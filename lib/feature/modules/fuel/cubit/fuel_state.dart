part of 'fuel_cubit.dart';

@immutable
abstract class FuelState {}

class InitialFuelState extends FuelState {}
class LoadingGetFuelState extends FuelState {}
class ErrorGetFuelState extends FuelState {}
class SuccessGetFuelState extends FuelState {}
class UpdateFuelState extends FuelState {}
class LoadingAddFuelState extends FuelState {}
class ErrorAddFuelState extends FuelState {}
class SuccessAddFuelState extends FuelState {}
