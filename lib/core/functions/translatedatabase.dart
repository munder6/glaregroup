import 'package:flutter/cupertino.dart';
import 'package:glaregroup/core/services/services.dart';
import 'package:get/get.dart';



translateDtaBase (columnar, columnen) {
  MyServices myServices = Get.find();
  if(myServices.sharedPreferences.getString("lang") == "ar"){
     return columnar;
  }else{
     return columnen;
  }

}