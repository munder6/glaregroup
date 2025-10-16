import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:glaregroup/controller/auth/successsignup_controller.dart';
import 'package:glaregroup/core/constant/color.dart';
import 'package:glaregroup/core/constant/imageasset.dart';

import '../../wedgit/auth/custombuttonauth.dart';


class SuccessSignUp extends StatelessWidget {
  const SuccessSignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SuccessSignUpControllerImp controller = Get.put(SuccessSignUpControllerImp());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColor.backgroundcolor,
        elevation: 0.0,
        title:  Text("35".tr, style: Theme.of(context).textTheme.displayLarge!.copyWith(color: AppColor.grey)),
      ),
     body: Container(
       padding: const EdgeInsets.all(15),
       child: Column(
         children:  [
           //const Center(child: Icon(Icons.check_circle_outline, size: 200,color: AppColor.primaryColor,)),
           const SizedBox(height: 30,),
           Image.asset(AppImageAsset.successall),
           const SizedBox(height: 70,),
           Text("36".tr,textAlign: TextAlign.center,),
           const Spacer(),
           SizedBox(
             width: double.infinity,
             child: CustomButtonAuth(
                 text: "37".tr,
                 onPressed: () {
                 controller.goToPageLogin();
                 }
             ),
           ),
         ],
       ),
     ) ,

      );
  }
}
