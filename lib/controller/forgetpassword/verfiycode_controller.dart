import 'package:get/get.dart';

import '../../core/class/statusrequest.dart';
import '../../core/constant/routes.dart';
import '../../core/functions/handlingdatacontroller.dart';
import '../../data/auth/verfiycoderesetpassword.dart';

abstract class VerifyCodeController extends GetxController {
  checkCode();
  goToResetPassword(String verifycode);
}

class VerifyCodeControllerImp extends VerifyCodeController {

  String? email;
  VerfiyCodeResetPasswordData verfiyCodeResetPasswordData = VerfiyCodeResetPasswordData(Get.find());
  StatusRequest? statusRequest;


  @override
  checkCode() {}

  @override
  goToResetPassword(verifycode) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await verfiyCodeResetPasswordData.postdata(
        email!, verifycode);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Get.offNamed(AppRoute.ResetPassword , arguments:
        {"email": email});
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


}


