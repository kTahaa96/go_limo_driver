import 'dart:async';
import 'dart:ui';

class TimerCallback {
  final int milliseconds;
  VoidCallback? action;
  Timer? _timer;

  TimerCallback({required this.milliseconds});

  run(VoidCallback action) {
    if (null != _timer) {
      _timer!.cancel();
    }
    _timer = Timer(Duration(milliseconds: milliseconds), action);
  }
}
