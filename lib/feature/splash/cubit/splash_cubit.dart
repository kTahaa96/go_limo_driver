import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(InitialSplashState());

  static SplashCubit of(context) => BlocProvider.of(context);

  bool openAnimation = false;
  int splashDuration = 3;

  switchAnimation() {
    Future.delayed(Duration(seconds: splashDuration), () {
      openAnimation = true;
      runSplash();
    });
  }

  runSplash() {
    Future.delayed(const Duration(milliseconds: 500), () async {
      bool isLogged = false;

      if (isLogged == true) {
        emit(AuthenticatedState());
      } else {
        emit(UnAuthenticatedState());
      }
    });
  }
}
