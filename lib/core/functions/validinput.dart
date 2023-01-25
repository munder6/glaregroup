import 'package:get/get.dart';

validInput(String val ,int min,int max,String type){
  if (type == "username"){
    if (!GetUtils.isUsername(val)){
      return "Not valid username";
    }
  }
  if (type == "email"){
    if (!GetUtils.isEmail(val)){
      return "Not valid email";
    }
  }
  if (type == "phone"){
    if (!GetUtils.isPhoneNumber(val)){
      return "Not valid phone";
    }
  }

  if (val.isEmpty){
    return "can't be Empty";
  }

  if (val.length < min){
    return "can't be less than $min";
  }

  if (val.length > max){
    return "can't be larger than $max";
  }


}
