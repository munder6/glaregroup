import 'dart:async';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:glaregroup/core/class/statusrequest.dart';
import 'package:glaregroup/core/constant/routes.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AddAddressController extends GetxController {

  StatusRequest statusRequest = StatusRequest.loading;

  Position? position;

   Completer<GoogleMapController>? completercontroller;

  List<Marker> markers = [];

  double? lat;
  double? long;

  CameraPosition? kGooglePlex ;


  addMarkers(LatLng latLng) {
    markers.clear();
    markers.add(Marker(markerId: MarkerId("1"), position: latLng));
    lat = latLng.latitude;
    long = latLng.longitude;
    print(lat);
    print(long);
    update();
  }

  goToPageAddDetailsAddress(){
    Get.toNamed(AppRoute.addressAddDetails,
        arguments: {
          "lat": lat.toString(),
          "long" : long.toString(),

        }
    );
  }


  getCurrentLocation() async {
   position = await Geolocator.getCurrentPosition() ;
   kGooglePlex = CameraPosition(
     target: LatLng(position!.latitude, position!.longitude),
     zoom: 14.4746,
   );

   addMarkers(LatLng(position!.latitude, position!.longitude));
   statusRequest = StatusRequest.none;
   update();
  }


  @override
  void onInit() {
    getCurrentLocation();
    completercontroller = Completer<GoogleMapController>();
    super.onInit();
  }
}