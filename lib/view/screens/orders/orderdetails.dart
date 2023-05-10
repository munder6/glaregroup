import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:glaregroup/controller/orders/ordersdetails_controller.dart';
import 'package:glaregroup/core/class/handlingdataview.dart';
import 'package:glaregroup/core/constant/color.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class OrderDetails extends StatelessWidget {
  const OrderDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    OrdersDetailsController controller = Get.put(OrdersDetailsController());
    return Scaffold(
      appBar: AppBar(
        title:  Text("138".tr, style: const TextStyle(color: AppColor.black),),
        centerTitle: true,
        backgroundColor: AppColor.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Container(
        padding:const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: GetBuilder<OrdersDetailsController> (
          builder: (controller) => HandlingDataView(
              statusRequest: controller.statusRequest,
              widget: ListView(
                children: [
                  const SizedBox(height: 20,),
                  Card(
                    elevation: 10,
                    shadowColor: AppColor.black.withOpacity(0.5),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)
                    ),
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: Table(
                          children: [
                            TableRow(
                                children: [
                                  Text("139".tr, textAlign: TextAlign.center,style: const TextStyle(color: AppColor.red, fontWeight: FontWeight.bold),),
                                  Text("140".tr, textAlign: TextAlign.center,style: const TextStyle(color: AppColor.red, fontWeight: FontWeight.bold),),
                                  Text("141".tr, textAlign: TextAlign.center,style: const TextStyle(color: AppColor.red, fontWeight: FontWeight.bold),),
                                ]
                            ),
                            ...List.generate(
                              controller.data.length, (index) =>
                             TableRow(
                                children: [
                                  Text("\n${controller.data[index].itemsName}", textAlign: TextAlign.center),
                                  Text("\n${controller.data[index].countitems}", textAlign: TextAlign.center,),
                                  Text("\n${controller.data[index].itemsPrice}", textAlign: TextAlign.center,),
                                ]
                            ),
                            ),
                            TableRow(
                                children: [
                                  const Text("", textAlign: TextAlign.center,style: TextStyle(color: AppColor.red, fontWeight: FontWeight.bold),),
                                  Text("\nDelivery ${controller.ordersModel.ordersPricedelivery}\$", textAlign: TextAlign.center,style: const TextStyle(color: AppColor.red,fontWeight: FontWeight.bold, fontSize: 13),),
                                  const Text("", textAlign: TextAlign.center,),
                                ]
                            ),
                            TableRow(
                                children: [
                                  const Text("", textAlign: TextAlign.center,style: TextStyle(color: AppColor.red, fontWeight: FontWeight.bold, ),),
                                  Text("Total Price: ${controller.ordersModel.ordersTotalprice}\$", textAlign: TextAlign.center,style: const TextStyle(color: AppColor.red, fontWeight: FontWeight.bold, fontSize: 13),),
                                  const Text("", textAlign: TextAlign.center,),
                                ]
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  if(controller.ordersModel.ordersType == "0") Center(child: Text("142".tr,style: const TextStyle(color: AppColor.red, fontWeight: FontWeight.bold)), ),
                  if(controller.ordersModel.ordersType == "0") Card(
                    elevation: 10,
                    shadowColor: AppColor.black.withOpacity(0.5),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)
                    ),
                    child:  ListTile(
                      title: Text("${controller.ordersModel.addressName}"),
                      subtitle: Text("${controller.ordersModel.addressCity}, ${controller.ordersModel.addressStreet}"),
                      trailing: const Icon(Icons.location_on),
                    ),
                  ),
                 if(controller.ordersModel.ordersType == "0") Card(
                    elevation: 10,
                    shadowColor: AppColor.black.withOpacity(0.5),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)
                    ),
                    child: Container(
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20))
                      ),
                      padding: const EdgeInsets.all(10),
                      height: 300,
                      width: double.infinity,
                      child: GoogleMap(
                        markers: controller.markers.toSet(),
                        mapType: MapType.hybrid,
                        initialCameraPosition: controller.cameraPosition!,
                        onMapCreated: (GoogleMapController controllermap) {
                          controller.completercontroller!.complete(controllermap);
                        },
                      ),
                    ),
                  )
                ],
              )),
        ),
      ),
    );
  }
}
