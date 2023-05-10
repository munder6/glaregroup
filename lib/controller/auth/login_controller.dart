// ignore_for_file: avoid_print

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:glaregroup/core/class/statusrequest.dart';
import 'package:glaregroup/core/constant/routes.dart';
import 'package:glaregroup/core/services/services.dart';
import '../../core/constant/color.dart';
import '../../core/functions/handlingdatacontroller.dart';
import '../../data/auth/login.dart';


abstract class LoginController extends GetxController{
  login();
  goToSignUp();
  goToForgetPassword();
}

class LoginControllerImp extends LoginController {

  LogInData loginData = LogInData(Get.find());


  GlobalKey<FormState> formstate = GlobalKey<FormState>();
 late TextEditingController email;
 late TextEditingController password;

 bool isShowPassword = true;

 MyServices myServices = Get.find();

 StatusRequest statusRequest = StatusRequest.none;

 showPassword(){
   isShowPassword = isShowPassword == true ? false : true;
   update();
 }


  @override
  login() async {
    if (formstate.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update() ;
      var response = await loginData.postdata(email.text , password.text);
      print("=============================== Controller $response ");
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          // data.addAll(response['data']);
          if(response['data']['users_approve'] == "1"){
            myServices.sharedPreferences.setString("id", response['data']['users_id']);
            String userid = myServices.sharedPreferences.getString("id")!;
            myServices.sharedPreferences.setString("username", response['data']['users_name']);
            myServices.sharedPreferences.setString("email", response['data']['users_email']);
            myServices.sharedPreferences.setString("phone", response['data']['users_phone']);
            myServices.sharedPreferences.setString("step", "2");
            FirebaseMessaging.instance.subscribeToTopic("users");
            FirebaseMessaging.instance.subscribeToTopic("users${userid}");
            Get.offNamed(AppRoute.homeScreen);
            Get.rawSnackbar(
                duration: const Duration(seconds: 1),
                barBlur: 10,
                backgroundColor: AppColor.green,
                margin: const EdgeInsets.all(20),
                borderRadius: 20,
                snackPosition: SnackPosition.TOP,
                icon: const Icon(Icons.done, color: AppColor.white,),
                title: "39".tr,
                messageText:Text(
                  "69".tr,
                  style: const TextStyle(
                      color : AppColor.white,
                      fontSize: 12),
                )
            );
          }else{
            Get.offNamed(AppRoute.verfiyCodeSignUp, arguments: {
              "email" : email.text
            });
          }
        } else {
          //Get.defaultDialog(title: "39".tr , middleText: "45".tr);
          Get.rawSnackbar(
            duration: const Duration(seconds: 1),
              barBlur: 10,
              backgroundColor: AppColor.red,
              margin: const EdgeInsets.all(20),
              borderRadius: 20,
              snackPosition: SnackPosition.TOP,
              icon: const Icon(Icons.not_interested, color: AppColor.white,),
              title: "39".tr,
              messageText:Text(
                "45".tr,
                style: const TextStyle(
                    color : AppColor.white,
                    fontSize: 12),
              )
          );
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    } else {

    }
  }

  @override
  goToSignUp() {
     Get.offNamed(AppRoute.signUp);
  }

  @override
  void onInit() {
   FirebaseMessaging.instance.getToken().then((value) {
     print(value);
     String? token = value;
   });
    email = TextEditingController();
    password = TextEditingController();

    super.onInit();
  }
  @override
  void dispose() {
     email.dispose();
     password.dispose();
      super.dispose();
  }

  @override
  goToForgetPassword() {
    Get.toNamed(AppRoute.ForgetPassword);
  }

}