import 'dart:io';

import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:glaregroup/controller/homescreen_controller.dart';
import 'package:glaregroup/core/constant/color.dart';
import 'package:glaregroup/core/constant/routes.dart';
import '../wedgit/home/custombottomappbarhome.dart';



class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(HomeScreenControllerImp());
    return GetBuilder<HomeScreenControllerImp>(builder: (controller) => Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColor.secondColor,
        onPressed: (){
          Get.toNamed(AppRoute.cart);
        },
        child: const Icon(EvaIcons.shoppingBagOutline, color: AppColor.white,),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: const CustomBottomAppBarHome(),
      body: WillPopScope(child: controller.listPage.elementAt(controller.currentpage) ,
          onWillPop: (){
        Get.defaultDialog(title: "39".tr,
            middleText: "40".tr,
            onCancel: (){} ,
            textConfirm: "41".tr,
            textCancel: "42".tr,
            cancelTextColor: AppColor.secondColor,
            confirmTextColor: AppColor.white,
            buttonColor: AppColor.red,
            onConfirm: (){exit(0);
        });
        return Future.value(false);
          }
      ),
      // bottomNavigationBar: ,
    ));
  }
}
