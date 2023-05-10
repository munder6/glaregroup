import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:glaregroup/controller/orders/orderpending_controller.dart';
import 'package:glaregroup/core/class/handlingdataview.dart';
import 'package:glaregroup/core/constant/color.dart';
import 'package:glaregroup/view/wedgit/order/customordercardlist.dart';

class OrdersPendingScreen extends StatelessWidget {
  const OrdersPendingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    OrdersPendingController controller = Get.put(OrdersPendingController());
    return Scaffold(
      appBar: AppBar(
        title:  Text("106".tr , style: const TextStyle(color: AppColor.black),),
        centerTitle: true,
        elevation: 0,
        backgroundColor: AppColor.white,
        iconTheme: const IconThemeData(color: AppColor.black),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Container(
          padding: const EdgeInsets.all(10),
          child: GetBuilder<OrdersPendingController>(
            builder: (controller) => HandlingDataView(statusRequest: controller.statusRequest, widget: ListView.builder(
              itemCount: controller.data.length,
              itemBuilder: ((context , index) =>  OrdersCardList(listdata: controller.data[index],) ),
            )),
          ) ,
      ),
    );
  }
}




