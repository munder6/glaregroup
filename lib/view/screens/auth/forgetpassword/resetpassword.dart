import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:glaregroup/core/constant/color.dart';
import '../../../../controller/forgetpassword/resetpassword_controller.dart';
import '../../../../core/class/handlingdataview.dart';
import '../../../../core/class/statusrequest.dart';
import '../../../wedgit/auth/custombuttonauth.dart';
import '../../../wedgit/auth/customtextbodyauth.dart';
import '../../../wedgit/auth/customtextformauth.dart';
import '../../../wedgit/auth/customtexttitleauth.dart';
import '../../../wedgit/auth/logoauth.dart';


class ResetPassword extends StatelessWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ResetPasswordControllerImp  controller = Get.put(ResetPasswordControllerImp());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColor.backgroundcolor,
        elevation: 0.0,
        title:  Text("22".tr, style: Theme.of(context).textTheme.headline1!.copyWith(color: AppColor.grey)),
      ),
      body: GetBuilder<ResetPasswordControllerImp>(builder: (controller) => HandlingDataRequest(
    statusRequest : controller.statusRequest,
    widget :
          Container(
            color: Colors.white,
            padding: const EdgeInsets.symmetric(vertical: 15 ,horizontal: 35),
            child: ListView(
              children: [
                const LogoResetPassword(),
                CustomTextTitleAuth(text: "29".tr,),
                const SizedBox(height: 15,),
                CustomTextBodyAuth(text: '30'.tr,),
                const SizedBox(height: 30,),
                CustomTextFormAuth(
                  isNumber: false,
                  valid: (val){

                  },
                  hinttext: '31'.tr,
                  labeltext: '8'.tr,
                  iconData: Icons.lock_outline_rounded,
                  mycontroller: controller.password,
                ),
                CustomTextFormAuth(
                  isNumber: false,
                  valid: (val){

                  },
                  hinttext: '34'.tr,
                  labeltext: '33'.tr,
                  iconData: Icons.lock_outline_rounded,
                  mycontroller: controller.repassword,
                ),
                const SizedBox(height: 40,),
                CustomButtonAuth(
                    text: "32".tr,
                    onPressed: () {
                      controller.goToSuccessResetPassword();
                    }
                ),
                const SizedBox(height: 32),
              ],
            ),
          )
        ,),
    ));
  }
}
