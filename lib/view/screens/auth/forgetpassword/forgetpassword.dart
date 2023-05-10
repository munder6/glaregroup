
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controller/forgetpassword/forgetpassword_controller.dart';
import '../../../../core/class/handlingdataview.dart';
import '../../../../core/class/statusrequest.dart';
import '../../../../core/constant/color.dart';
import '../../../wedgit/auth/custombuttonauth.dart';
import '../../../wedgit/auth/customtextbodyauth.dart';
import '../../../wedgit/auth/customtextformauth.dart';
import '../../../wedgit/auth/customtexttitleauth.dart';
import '../../../wedgit/auth/logoauth.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ForgetPasswordControllerImp());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColor.backgroundcolor,
        elevation: 0.0,
        title: Text('22'.tr,
            style: Theme.of(context)
                .textTheme
                .headline1!
                .copyWith(color: AppColor.grey)),
      ),
      body: GetBuilder<ForgetPasswordControllerImp>(
          builder: (controller) => HandlingDataRequest(
          statusRequest : controller.statusRequest,
           widget : Container(
            padding:
            const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
            child: Form(
              key: controller.formstate,
              child: ListView(children: [
                CustomTextTitleAuth(text: "22".tr),
                const SizedBox(height: 10),
                CustomTextBodyAuth(text: "23".tr),
                const VerfiyEmailPhoto(),
                CustomTextFormAuth(
                  isNumber: false,
                  valid: (val) {},
                  mycontroller: controller.email,
                  hinttext: "6".tr,
                  iconData: Icons.email_outlined,
                  labeltext: "5".tr,
                  // mycontroller: ,
                ),
                const SizedBox(height : 20),
                CustomButtonAuth(
                    text: "24".tr,
                    onPressed: () {
                      controller.checkemail();
                    }
                ),
              ]),
            ),
          )),
    ));
  }
}