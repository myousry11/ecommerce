import 'dart:async';

import 'package:ecommerce/core/class/statusrequest.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../core/constant/routes.dart';

class AddAddressController extends GetxController {
  StatusRequest statusRequest = StatusRequest.loading;

  Completer<GoogleMapController>? controllerCompleter;

  List<Marker> markers = [];

  double? lat;
  double? long;

  addMarkers(LatLng latLng) {
    markers.clear();
    markers.add(Marker(markerId: MarkerId("1"), position: latLng));
    lat = latLng.latitude;
    long = latLng.longitude;
    update();
  }

  Position? position;

  CameraPosition? kGooglePlex;

  // static const CameraPosition _kLake = CameraPosition(
  //     bearing: 192.8334901395799,
  //     target: LatLng(37.43296265331129, -122.08832357078792),
  //     tilt: 59.440717697143555,
  //     zoom: 19.151926040649414
  // );

  getCurrentLocation() async {
    position = await Geolocator.getCurrentPosition();
    kGooglePlex = CameraPosition(
      target: LatLng(position!.latitude, position!.longitude),
      zoom: 14.4746,
    );
    addMarkers(LatLng(position!.latitude, position!.longitude));
    statusRequest = StatusRequest.none;
    update();
  }

  goToAddDetailsAddress() {
    Get.toNamed(AppRoute.addressAddDetails, arguments: {
      "lat" : lat.toString(),
      "long" : long.toString(),
    });
  }
  @override
  void onInit() {
    controllerCompleter = Completer<GoogleMapController>();
    getCurrentLocation();
    super.onInit();
  }
}
