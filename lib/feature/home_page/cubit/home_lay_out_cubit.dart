import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../modules/driver_order/driver_orders.dart';
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

  void updatePageIndex({required int newVal}) {
    log('===> $newVal');
    currentIndex = newVal;

    emit(UpdatePageIndexState());
  }
}
