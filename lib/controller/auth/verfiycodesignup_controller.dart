import 'package:get/get.dart';

import '../../core/class/statusrequest.dart';
import '../../core/constant/routes.dart';
import '../../core/functions/handlingdatacontroller.dart';
import '../../data/auth/verfiycodesignup.dart';

abstract class VerifyCodeSignUpController extends GetxController {
  checkCode();
  goToSuccessSignUp(String verfiyCodeSignup);
}

class VerifyCodeSignUpControllerImp extends VerifyCodeSignUpController {

  VerifycodeSignUpData verifycodeSignUpData = VerifycodeSignUpData(Get.find());


  String? email;

  StatusRequest statusRequest = StatusRequest.none;

  @override
  checkCode() {}

  @override
  goToSuccessSignUp(verfiyCodeSignup) async {
      statusRequest = StatusRequest.loading;
      update();
      var response = await verifycodeSignUpData.postdata(
           email!, verfiyCodeSignup);
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          Get.offNamed(AppRoute.successSignUp);
        } else {
          Get.defaultDialog(title: "39".tr , middleText: "44".tr) ;
          statusRequest = StatusRequest.failure;
        }
      }
      update();
  }

  @override
  void onInit() {
    email = Get.arguments['email'];
    super.onInit();
  }

  reSend(){
     verifycodeSignUpData.resendData(email!);
  }


}