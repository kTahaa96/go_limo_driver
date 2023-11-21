import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:golimo_driver/core/models/fuel/get_fuel_histor_response.dart';
import 'package:golimo_driver/core/models/fuel/history_item_model.dart';
import 'package:golimo_driver/helpers/network/repository.dart';
import 'package:meta/meta.dart';

part 'fuel_state.dart';

class FuelCubit extends Cubit<FuelState> {
  final Repository repository;

  FuelCubit({required this.repository}) : super(InitialFuelState());

  static FuelCubit of(context) => BlocProvider.of(context);

  FuelHistoryResponse? fuelHistoryResponse;


  HistoryItem? addFuelRequestModel ;





  void getFuelHistory() async {
    emit(LoadGetFuelState());
    final f = await repository.getFuelHistory();
    f.fold((l) {
      emit(ErrorGetFuelState());
    }, (r) {
      fuelHistoryResponse = r;
      emit(SuccessGetFuelState());
    });
  }
}
