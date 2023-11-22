part of 'dirver_orders_cubit.dart';

@immutable
abstract class DriverOrdersState {}

class InitialDriverOrdersState extends DriverOrdersState {}
class LoadingPreviousTripsState extends DriverOrdersState {}
class ErrorPreviousTripsState extends DriverOrdersState {}
class SuccessPreviousTripsState extends DriverOrdersState {}

class LoadingUpcomingTripsState extends DriverOrdersState {}
class ErrorUpcomingTripsState extends DriverOrdersState {}
class SuccessUpcomingTripsState extends DriverOrdersState {}
