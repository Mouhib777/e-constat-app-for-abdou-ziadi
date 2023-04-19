import 'package:flutter/material.dart';
import 'package:flutter_geocoder/geocoder.dart';
import 'package:flutter_geocoder/model.dart';
import 'package:flutter_geocoder/services/base.dart';
import 'package:flutter_geocoder/services/distant_google.dart';
import 'package:flutter_geocoder/services/local.dart';

import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
//import 'package:shared_preferences/shared_preferences.dart';

@override
class LocationProvider with ChangeNotifier {
  late double latitude;
  late double longitude;
  //final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  bool permissionAllowed = false;
  var selectedAddress;
  late String? featureName;
  late String? AddressLine;

  Future<void> getCurrentPosition() async {
    Future<Position> getLocation() async {
      // Test if location services are enabled.
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        // Location services are not enabled don't continue
        // accessing the position and request users of the
        // App to enable the location services.
        return Future.error('Location services are disabled.');
      }

      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.deniedForever) {
          // Permissions are denied forever, handle appropriately.
          return Future.error(
              Exception('Location permissions are permanently denied.'));
        }

        if (permission == LocationPermission.denied) {
          // Permissions are denied, next time you could try
          // requesting permissions again (this is also where
          // Android's shouldShowRequestPermissionRationale
          // returned true. According to Android guidelines
          // your App should show an explanatory UI now.
          return Future.error(Exception('Location permissions are denied.'));
        }
      }

      // When we reach here, permissions are granted and we can
      // continue accessing the position of the device.
      return await Geolocator.getCurrentPosition();
    }

    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    if (position != null) {
      this.latitude = position.latitude;
      this.longitude = position.longitude;
      this.permissionAllowed = true;
      final coordinates = Coordinates(this.latitude, this.longitude);
      var addresses =
          await Geocoder.local.findAddressesFromCoordinates(coordinates);

      this.selectedAddress = addresses.first;
      this.permissionAllowed = true;
      notifyListeners();
    } else {
      print('Permission NOT ALLOWED');
    }
  }

  void onCameraMove(CameraPosition cameraPosition) async {
    this.latitude = cameraPosition.target.latitude;
    this.longitude = cameraPosition.target.longitude;
    notifyListeners();
  }

  Future<void> getMoveCamera() async {
    final coordinates = Coordinates(this.latitude, this.longitude);
    final addresses =
        await Geocoder.local.findAddressesFromCoordinates(coordinates);

    this.selectedAddress = addresses.first;
    print("${selectedAddress.addressLine}  ");
  }

  // Future<void> save_PickUP_Prefs() async {
  //   // final SharedPreferences prefs = await _prefs;
  //   prefs.setDouble('PickUp_latitude', this.latitude);
  //   prefs.setDouble('PickUp_longitude', this.longitude);
  //   prefs.setString('PickUp_address', this.selectedAddress.addressLine);
  //   prefs.setString('PickUp_location', this.selectedAddress.featureName);
  // }

  // Future<void> save_Delivery_Prefs() async {
  //   // final SharedPreferences prefs = await _prefs;
  // //   prefs.setDouble('delivery_latitude', this.latitude);
  //   prefs.setDouble('delivery_longitude', this.longitude);
  //   prefs.setString('delivery_address', this.selectedAddress.addressLine);
  //   prefs.setString('delivery_location', this.selectedAddress.featureName);
  // }
}
