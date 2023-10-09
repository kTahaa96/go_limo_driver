import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'home_lay_out_state.dart';

class HomeLayOutCubit extends Cubit<HomeLayOutState> {
  HomeLayOutCubit() : super(InitialHomeLayoutState());

  static HomeLayOutCubit of(context) => BlocProvider.of(context);

  int currentIndex = 0;

  void updatePageIndex({required int newVal}) {
    currentIndex = newVal;
    emit(UpdatePageIndexState());
  }
}
