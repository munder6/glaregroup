import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:glaregroup/core/constant/color.dart';
import 'package:glaregroup/core/functions/fcmconfig.dart';
import 'package:glaregroup/core/services/services.dart';
import '../constant/apptheme.dart';

class LocalController extends GetxController {
  Locale? language ;



  MyServices myServices = Get.find();


  ThemeData appTheme = themeEnglish;


  chaneLang (String langcode){
   Locale locale = Locale(langcode);
   myServices.sharedPreferences.setString("lang", langcode);
   appTheme = langcode == "ar" ? themeArabic : themeEnglish;
   Get.changeTheme(appTheme);
   Get.updateLocale(locale);
  }

  requestPermissionLocation ()async{
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled){
      return Get.snackbar("39".tr, "91".tr, backgroundColor: AppColor.white);
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied){
      permission = await Geolocator.requestPermission();
      if(permission == LocationPermission.denied){
        return Get.snackbar("39".tr, "92".tr,backgroundColor: AppColor.white);
      }
    }
    if ( permission == LocationPermission.deniedForever){
      return  Get.snackbar("39".tr, "93".tr,backgroundColor: AppColor.white);
    }
  }

  @override
  void onInit(){
    requestPermissionNotification();
    fcmConfig();
    requestPermissionLocation ();
    String? sharedPrefLang = myServices.sharedPreferences.getString("lang");
    if (sharedPrefLang == "ar"){
      language = const Locale("ar");
      appTheme = themeArabic;
    }else if (sharedPrefLang == "en"){
      language = const Locale("en");
      appTheme = themeEnglish;
    }else {
      language = Locale(Get.deviceLocale!.languageCode);
    }
    super.onInit();
  }
}

