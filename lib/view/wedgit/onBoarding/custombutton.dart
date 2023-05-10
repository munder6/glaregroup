
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/onboarding_controller.dart';
import '../../../core/constant/color.dart';

class CustomButtonOnBoarding extends GetView<OnBoardingControllerImp> {
  const CustomButtonOnBoarding({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 30),
      height: 50,
      child: MaterialButton(
        //elevation: 5.0,
          shape: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50),
            borderSide: BorderSide.none
          ),
          padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 0),
          textColor: Colors.white,
          onPressed: () {
            controller.next() ;
          },
          color: AppColor.primaryColor,
          child:  Text("68".tr)),

    );
  }
}