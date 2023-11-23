import 'dart:developer' as printLine;
import 'dart:math';

import 'package:dartz/dartz.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

abstract class LocationStatus {}

class LocationDisabled extends LocationStatus {}

class LocationDeniedForever extends LocationStatus {}

class LocationDenied extends LocationStatus {}

class LocationError extends LocationStatus {
  final String error = "An error occurred while accessing the location. Please try again";
}

class LocationHelper {
  double _toRadians(double degrees) => degrees * pi / 180;

  num _haversin(double radians) => pow(sin(radians / 2), 2);

  double distance(LatLng startPoint, LatLng endPoint) {
    const r = 6372.8; // Earth radius in kilometers
    final dLat = _toRadians(endPoint.latitude - startPoint.latitude);
    final dLon = _toRadians(endPoint.longitude - startPoint.longitude);
    final lat1Radians = _toRadians(startPoint.latitude);
    final lat2Radians = _toRadians(endPoint.latitude);

    final a = _haversin(dLat) + cos(lat1Radians) * cos(lat2Radians) * _haversin(dLon);
    final c = 2 * asin(sqrt(a));
    printLine.log("DISTANCE ====> ${r * c}");

    return r * c;
  }

  Future<bool> handleLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // _showAlertDialog(NamedNavigatorImpl.navigatorState.currentContext!);
      return false;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // _showAlertDialog(NamedNavigatorImpl.navigatorState.currentContext!);

        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      // _showAlertDialog(NamedNavigatorImpl.navigatorState.currentContext!);

      return false;
    }
    return true;
  }

  Future<String> getAddressFromLatLng(LatLng latLng) async {
    try {
      List<Placemark> place = await placemarkFromCoordinates(latLng.latitude, latLng.longitude);
      String address =
          '${place.first.name}, ${place.first.subLocality}, ${place.first.locality}, ${place.first.country}';
      return address;
    } catch (e) {
      return " ";
    }
  }

  // bool checkOnMap(LatLng point, CityPolygonsResponse polygonsList) {
  //   List<LatLng> _polygonsList = [];
  //   polygonsList.data!.polygons.forEach((element) {
  //     _polygonsList.add(LatLng(element.latitude, element.longitude));
  //   });
  //   bool isValid;
  //   List<toolKit.LatLng> convertedList =
  //   _polygonsList.map((e) => toolKit.LatLng(e.latitude, e.longitude)).toList();
  //   isValid = toolKit.PolygonUtil.containsLocation(
  //       toolKit.LatLng(point.latitude, point.longitude), convertedList, false);
  //   return isValid;
  // }
  static Future<LatLng> getMyCurrentLocation() async {
    try {
      LatLng? position;
      final f = await LocationHelper.determinePosition();
      f.fold((l) {
        throw l;
      }, (r) {
        position = r;
      });
      if (position == null) {
        throw Exception('An error occurred while accessing the location');
      }
      return position!;
    } catch (e) {
      rethrow;
    }
  }

  static Future<bool> get isLocationServiceEnabled => Geolocator.isLocationServiceEnabled();

  static Future<bool> openLocationSettings() => Geolocator.openLocationSettings();

  static Future<bool> openAppSettings() => Geolocator.openAppSettings();

  static Future<LocationPermission> checkPermission() => Geolocator.checkPermission();

  static Future<Either<LocationStatus, LatLng>> determinePosition() async {
    LocationPermission checkPermission = await Geolocator.checkPermission();

    if (checkPermission == LocationPermission.deniedForever) {
      return Left(LocationDeniedForever());
    }

    if (checkPermission == LocationPermission.denied) {
      checkPermission = await Geolocator.requestPermission();

      if (checkPermission != LocationPermission.whileInUse &&
          checkPermission != LocationPermission.always) {
        return Left(LocationDenied());
      }
    }
    try {
      final position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      return Right(LatLng(position.latitude, position.longitude));
    } on LocationServiceDisabledException {
      return Left(LocationDisabled());
    } catch (e) {
      return Left(LocationError());
    }
  }
}
