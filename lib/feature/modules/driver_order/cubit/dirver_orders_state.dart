part of 'dirver_orders_cubit.dart';

@immutable
abstract class DriverOrdersState {}

class InitialDriverOrdersState extends DriverOrdersState {}
class LoadingDriverOrdersState extends DriverOrdersState {}
class ErrorDriverOrdersState extends DriverOrdersState {}
class SuccessDriverOrdersState extends DriverOrdersState {}
