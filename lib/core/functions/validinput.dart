import 'package:get/get.dart';

validInput(String val ,int min,int max,String type){
  if (type == "username"){
    if (!GetUtils.isUsername(val)){
      return "87".tr;
    }
  }
  if (type == "email"){
    if (!GetUtils.isEmail(val)){
      return "88".tr;
    }
  }
  if (type == "phone"){
    if (!GetUtils.isPhoneNumber(val)){
      return "89".tr;
    }
  }

  if (val.isEmpty){
    return "90".tr;
  }

  if (val.length < min){
    return "can't be less than $min";
  }

  if (val.length > max){
    return "can't be larger than $max";
  }


}
