import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:glaregroup/controller/orders/ordersarchive_controller.dart';
import 'package:glaregroup/core/constant/color.dart';
import 'package:glaregroup/core/constant/routes.dart';
import 'package:glaregroup/data/model/ordersmodel.dart';
import 'package:glaregroup/view/wedgit/offers/ratingdialog.dart';
import 'package:jiffy/jiffy.dart';

class OrdersCardListArchive extends GetView<OrdersArchiveController> {
  final OrdersModel listdata;
  const OrdersCardListArchive({Key? key, required this.listdata}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Card(
      elevation: 10,
      shadowColor: AppColor.black.withOpacity(0.5),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20)
      ),
      child: Container(
        padding:const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Row(children: [
              Text("131".tr,style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              Text("  ${listdata.ordersId}", style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: AppColor.primaryColor)),
              const Spacer(),
              Text(
                Jiffy.parse(
                  listdata.ordersDatetime!,
                  pattern: "yyyy-MM-dd",
                ).fromNow(),
                style: const TextStyle(color: AppColor.primaryColor),
              )
            ],),
            const Divider(),
            Row(children: [
              Text("126".tr),
              Text(" : ${controller.printOrderType(listdata.ordersType!)}"),
            ]),
            Row(children: [
              Text("127".tr),
              Text(" : ${listdata.ordersPrice!}\$"),
            ]),
            Row(children: [
              Text("128".tr),
              Text(" : ${listdata.ordersPricedelivery!}\$"),
            ]),
            Row(children: [
              Text("129".tr),
              Text(" : ${controller.printPaymentMethod(listdata.ordersPaymentmethod!)}"),
            ]),
            Row(children: [
              Text("130".tr),
              Text(" : ${controller.printOrderStatus(listdata.ordersStatus!)}"),
            ]),
            const Divider(),
            Row(children: [
              Text("132".tr, style: const TextStyle(fontWeight: FontWeight.bold , color: AppColor.red)),
              Text(" : ${listdata.ordersTotalprice}\$",style: const TextStyle(fontWeight: FontWeight.bold , color: AppColor.red)),
              const Spacer(),
              MaterialButton(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                onPressed: (){
                  Get.toNamed(AppRoute.ordersDetails, arguments: {
                    "ordersmodel" : listdata
                  });
                },
                color: AppColor.primaryColor,
                child:  Text("133".tr ,
                  style: const TextStyle(color: Colors.white),
                ),),
              const SizedBox(width: 5),
             if(listdata.ordersRating == "0")  MaterialButton(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                onPressed: (){
                  showDialogRating(context, listdata.ordersId!);
                },
                color: AppColor.primaryColor,
                child:  Text("146".tr ,
                  style: const TextStyle(color: Colors.white),
                ),),
            ],),
          ],
        ),
      ),
    );
  }
}