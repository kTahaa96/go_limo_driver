import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:golimo_driver/core/models/driver_order_response/driver_trips_item_model.dart';
import 'package:golimo_driver/core/models/home_module/home_module_response.dart';
import 'package:golimo_driver/core/models/home_module/notification_item.dart';
import 'package:golimo_driver/helpers/navigator/named-navigator_impl.dart';
import 'package:golimo_driver/helpers/network/repository.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final Repository repository;

  HomeCubit({required this.repository}) : super(InitialHomeState());

  static HomeCubit of(context) => BlocProvider.of(context);

  List<NotificationModel> notificationList = [];
  HomeModuleResponse? homeModuleResponse;
  bool hasPermission = false;
  List<TripItemModel> onGoingTrips = [];
  List<TripItemModel> todayTrips = [];

  late Position _currentPosition;

  void getHomeData() async {
    emit(LoadingHomeState());
    await _getCurrentPosition();
    final f =
        await repository.getHomeData(LatLng(_currentPosition.latitude, _currentPosition.longitude));
    f.fold((l) {
      emit(ErrorHomeState());
    }, (r) {
      homeModuleResponse = r;

      todayTrips = homeModuleResponse!.data.todayTrips;
      onGoingTrips = homeModuleResponse!.data.ongoingTrips;
      emit(SuccessHomeState());
    });
  }

  Future<bool> _handleLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      ScaffoldMessenger.of(NamedNavigatorImpl.navigatorState.currentContext!).showSnackBar(
          const SnackBar(
              content: Text('Location services are disabled. Please enable the services')));
      return false;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        ScaffoldMessenger.of(NamedNavigatorImpl.navigatorState.currentContext!)
            .showSnackBar(const SnackBar(content: Text('Location permissions are denied')));
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      ScaffoldMessenger.of(NamedNavigatorImpl.navigatorState.currentContext!).showSnackBar(
          const SnackBar(
              content: Text(
                  'Location permissions are permanently denied, we cannot request permissions.')));
      return false;
    }
    return true;
  }

  Future<void> _getCurrentPosition() async {
    final hasPermission = await _handleLocationPermission();
    if (!hasPermission) return;
    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((Position position) {
      _currentPosition = position;
      log('${_currentPosition.latitude} , ${_currentPosition.longitude}');
      emit(SuccessGetLocationState());
    }).catchError((e) {
      emit(ErrorGetLocationState());
      debugPrint(e);
    });
  }
}
