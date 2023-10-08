import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:golimo_driver/core/consts/strings.dart';
import 'package:golimo_driver/core/models/trip_info/address_model/address_model.dart';
import 'package:golimo_driver/core/models/trip_info/cities/city_model.dart';
import 'package:golimo_driver/core/models/trip_info/cities/city_polygons_response.dart';
import 'package:golimo_driver/helpers/network/repository.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:meta/meta.dart';

part 'location_state.dart';

class LocationCubit extends Cubit<LocationState> {
  final Repository repository;

  LocationCubit({required this.repository}) : super(InitialLocationSearchState());

  static LocationCubit of(context) => BlocProvider.of(context);

  late CityPolygonsResponse cityPolygonsResponse;
  final places = GoogleMapsPlaces(apiKey: Strings.googleMapApiKey);
  List<Prediction> searchResults = [];
  late AddressModel selectedAddress;

  void getPolygons({required int cityId}) async {
    // emit(LoadingLocationListState());
    // final f = await repository.getCityPolygons(cityId: cityId);
    // f.fold((l) {
    //   emit(ErrorLocationListState());
    // }, (r) {
    //   cityPolygonsResponse = r;
    //   emit(SuccessLocationListState());
    // });
  }

  Future<void> getPlaces(String value, CityModel model) async {
    emit(LoadingLocationSearchState());
    log("${model.nameEn} ==> ${model.polygon.toJson()}");

    final response = await places.autocomplete(
      value,
      location: boundsToLocation(LatLngBounds(
        southwest: LatLng(model.polygon.southWest.latitude, model.polygon.southWest.longitude),
        northeast: LatLng(model.polygon.northEast.latitude, model.polygon.northEast.longitude),
      )),
      radius: 100000,
      strictbounds: true,
    );
    if (response.isOkay) {
      List<Prediction> placeList = [];

      if (response.predictions.isEmpty) {
        emit(EmptyLocationSearchState());
      } else {
        placeList = response.predictions;
        searchResults = placeList;

        emit(SuccessLocationSearchState());
      }
    } else {

      emit(ErrorLocationSearchState());
    }
  }

  Location boundsToLocation(LatLngBounds bounds) {
    final northeast = bounds.northeast;
    final southwest = bounds.southwest;
    final latitude = (northeast.latitude + southwest.latitude) / 2;
    final longitude = (northeast.longitude + southwest.longitude) / 2;
    return Location(lat: latitude, lng: longitude);
  }

  Future<void> onSelectAddress({required String placeId}) async {
    final placeDetails = await places.getDetailsByPlaceId(placeId);
    final location = placeDetails.result.geometry!.location;
    selectedAddress = AddressModel(
      address: placeDetails.result.name,
      latitude: location.lat,
      longitude: location.lng,
    );
    log('${selectedAddress.toJson() }');
    emit(SuccessLocationSelect(selectedAddress));
  }
}
