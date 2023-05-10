import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:glaregroup/controller/address/add_controller.dart';
import 'package:glaregroup/core/class/handlingdataview.dart';
import 'package:glaregroup/core/constant/color.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AddressAdd extends StatelessWidget {
  const AddressAdd({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AddAddressController controllerpage = Get.put(AddAddressController());

    return Scaffold(
      appBar: AppBar(
        title:  Text("94".tr, style: const TextStyle(color: AppColor.black),),
        centerTitle: true,
        backgroundColor: AppColor.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Container(
        child: GetBuilder<AddAddressController>(
          builder: ((controllerpage) => HandlingDataView(
              statusRequest: controllerpage.statusRequest,
              widget: Column(
                children: [
                if (controllerpage.kGooglePlex != null)  Expanded(
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        GoogleMap(
                          markers: controllerpage.markers.toSet(),
                          onTap: (latlong) {
                            controllerpage.addMarkers(latlong);
                          },
                          mapType: MapType.hybrid,
                          initialCameraPosition: controllerpage.kGooglePlex!,
                          onMapCreated: (GoogleMapController controllermap) {
                            controllerpage.completercontroller!.complete(controllermap);
                          },
                        ),
                        Positioned(
                          bottom: 30,
                          left: 20,
                          child: Container(
                            decoration: BoxDecoration(
                              color: AppColor.white,
                              borderRadius: BorderRadius.circular(50)
                            ),
                            child: MaterialButton(
                                onPressed: (){
                                 controllerpage.goToPageAddDetailsAddress();
                                },
                              child:  Text("95".tr, style: const TextStyle(color: AppColor.black),),
                            ),
                          ),
                        )
                      ],
                    )
                )
                ],
              )
          )
          ),
        ),
      ),
    );
  }
}
