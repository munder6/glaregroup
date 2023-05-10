import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:glaregroup/core/constant/routes.dart';
import 'package:glaregroup/core/services/services.dart';

import '../core/constant/color.dart';

class SettingsController extends GetxController {

  MyServices myServices = Get.find();


  logout(){
    String userid = myServices.sharedPreferences.getString("id")!;
    FirebaseMessaging.instance.unsubscribeFromTopic("users");
    FirebaseMessaging.instance.unsubscribeFromTopic("users${userid}");
    myServices.sharedPreferences.clear();
    Get.offAllNamed(AppRoute.chooseLang);
    Get.rawSnackbar(
        duration: const Duration(seconds: 1),
        barBlur: 10,
        backgroundColor: AppColor.green,
        margin: const EdgeInsets.all(20),
        borderRadius: 20,
        snackPosition: SnackPosition.BOTTOM,
        icon: const Icon(Icons.done, color: AppColor.white,),
        title: "39".tr,
        messageText:Text(
          "71".tr,
          style: const TextStyle(
              color : AppColor.white,
              fontSize: 12),
        )
    );
  }
}