import 'dart:developer';
import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:golimo_driver/core/models/fuel/fuel_request_model.dart';
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

  HistoryItem? addFuelRequestModel;

  File? beforeAdd, afterAdd, receipt;
  int? amount, letterNo, type, meterBefore, metersAfter;

  int currentView = 0;

  int fuelType = 1;

  updateImage({required File image}) {
    if (currentView == 0) {
      beforeAdd = image;
    } else if (currentView == 1) {
      afterAdd = image;
    } else {
      receipt = image;
    }

    emit(UpdateFuelState());
  }

  resetImage() {
    if (currentView == 0) {
      beforeAdd = null;
    } else if (currentView == 1) {
      afterAdd = null;
    } else {
      receipt = null;
    }

    emit(UpdateFuelState());
  }

  void getFuelHistory() async {
    emit(LoadingGetFuelState());
    final f = await repository.getFuelHistory();
    f.fold((l) {
      emit(ErrorGetFuelState());
    }, (r) {
      fuelHistoryResponse = r;
      emit(SuccessGetFuelState());
    });
  }

  updateFuelType(int value) {
    fuelType = value;
    emit(UpdateFuelState());
  }

  updateStep({required String kMeters}) {
    log("Now ==> ${currentView}");
    if (currentView == 0) {
      meterBefore = int.parse(kMeters);
      log('${meterBefore} && ${beforeAdd?.path}');
    } else if (currentView == 1) {
      metersAfter = int.parse(kMeters);
      log('${meterBefore} && ${beforeAdd?.path}');
      log('${meterBefore} && ${beforeAdd?.path}');
    }
    currentView++;
    emit(UpdateFuelState());
  }

  void addFuel() async {
    emit(LoadingAddFuelState());
    final f = await repository.addFuel(
        requestModel: FuelApiRequestModel(
            amount: amount!,
            kilometersAfter: metersAfter!,
            kilometersBefore: meterBefore!,
            litersNo: letterNo!,
            meterImageAfter: afterAdd!,
            meterImageBefore: beforeAdd!,
            receiptImage: receipt!,
            type: fuelType));
  }
}
