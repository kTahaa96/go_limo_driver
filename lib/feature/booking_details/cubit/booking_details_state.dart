part of 'booking_details_cubit.dart';

@immutable
abstract class BookingDetailsState {}

class InitialBookingDetailsState extends BookingDetailsState {}
class ConfirmReceiptBookState extends BookingDetailsState {}
class LoadingBookState extends BookingDetailsState {}
class StartTripState extends BookingDetailsState {}
class ConfirmedFuelSettingState extends BookingDetailsState {}
class ConfirmedTripSettingState extends BookingDetailsState {}

class UpdateBookingDetailsState extends BookingDetailsState {
  final int state ;
  UpdateBookingDetailsState(this.state);
}
