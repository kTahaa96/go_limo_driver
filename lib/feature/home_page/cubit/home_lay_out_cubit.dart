import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:golimo_driver/helpers/local/user_preferences/user_preferences_helper.dart';

import '../../../core/models/userr_response/user_data.dart';
import '../../modules/driver_order/driver_orders_screen.dart';
import '../../modules/fuel/fuel_screen.dart';
import '../../modules/help_center/help_center.dart';
import '../../modules/home/home_page_screen.dart';
import '../../modules/notificatiton_center/notification_center.dart';
import '../../modules/rewards/rewards.dart';

part 'home_lay_out_state.dart';

class HomeLayOutCubit extends Cubit<HomeLayOutState> {
  HomeLayOutCubit() : super(InitialHomeLayoutState());

  static HomeLayOutCubit of(context) => BlocProvider.of(context);
  List<Widget> screensList = [
    const HomePageScreen(),
    const DriverOrders(),
    const RewardsScreen(),
    const FuelScreen(),
    const NotificationCenter(),
    const HelpCenter(),
  ];
  int currentIndex = 0;
  Widget currentWidget = const HomePageScreen();
  UserData? user;

  void getHomeData() {
    emit(LoadingGetHomeDataState());
    user = UserPreferencesHelper().getUserPreference();
    log('${user!.driver.fullName}');
    log('${user!.driver.mobile}');
    log('${user!.driver.id}');
    emit(SuccessGetHomeDataState());
  }

  void updatePageIndex({required int newVal}) {
    log('===> $newVal');
    currentIndex = newVal;
    currentWidget = screensList[currentIndex];

    emit(UpdatePageIndexState());
  }
}
