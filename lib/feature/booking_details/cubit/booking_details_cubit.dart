import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'booking_details_state.dart';

class BookingDetailsCubit extends Cubit<BookingDetailsState> {
  BookingDetailsCubit() : super(InitialBookingDetailsState());

  static BookingDetailsCubit of(context) => BlocProvider.of(context);

  int orderStatus = 0;
  int _secondsRemaining = 30 * 60; // 30 minutes in seconds
  Timer? _timer;

  void changeOrderState(int newState) {
    orderStatus = newState;
    emit(UpdateBookingDetailsState());
  }

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(oneSec, (Timer timer) {
      if (_secondsRemaining < 1) {
        timer.cancel();
        // Timer has reached 0 seconds, you can perform any actions here
      } else {
        _secondsRemaining--;
      }
    });
  }

  String formatTime(int seconds) {
    int minutes = (seconds / 60).truncate();
    int remainingSeconds = seconds % 60;
    String minutesStr = minutes.toString().padLeft(2, '0');
    String secondsStr = remainingSeconds.toString().padLeft(2, '0');
    return '$minutesStr:$secondsStr';
  }
}
