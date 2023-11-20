part of 'fuel_cubit.dart';

@immutable
abstract class FuelState {}

class InitialFuelState extends FuelState {}
class LoadGetFuelState extends FuelState {}
class ErrorGetFuelState extends FuelState {}
class SuccessGetFuelState extends FuelState {}
