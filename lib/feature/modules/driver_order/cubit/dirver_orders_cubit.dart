import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:golimo_driver/core/models/driver_order_response/driver_trips_item_model.dart';
import 'package:golimo_driver/core/models/driver_order_response/trips_response.dart';
import 'package:golimo_driver/helpers/network/repository.dart';
import 'package:meta/meta.dart';

part 'dirver_orders_state.dart';

class DriverOrdersCubit extends Cubit<DriverOrdersState> {
  final Repository repository;

  DriverOrdersCubit({required this.repository}) : super(InitialDriverOrdersState());

    static DriverOrdersCubit of(context) => BlocProvider.of(context);
  late DriverTripsResponse driverTripsResponse;
  List<TripItemModel> previousTrips = [];
  List<TripItemModel> upcomingTrips = [];


  void getPreviousTripsOrder() async {
    emit(LoadingPreviousTripsState());

    final f = await repository.getDriverOrders(isPrevious: true);
    f.fold((l) {
      emit(ErrorPreviousTripsState());
    }, (r) {
      previousTrips = r.data;

      emit(SuccessPreviousTripsState());
    });
  }

  void getUpcomingTripsOrder() async {
    emit(LoadingUpcomingTripsState());

    final f = await repository.getDriverOrders(isPrevious: false);
    f.fold((l) {
      emit(ErrorUpcomingTripsState());
    }, (r) {
      upcomingTrips = r.data;

      emit(SuccessUpcomingTripsState());
      getPreviousTripsOrder();
    });
  }
}
