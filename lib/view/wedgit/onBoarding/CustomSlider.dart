import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/onboarding_controller.dart';
import '../../../core/constant/color.dart';
import '../../../data/static/static.dart';
import 'package:lottie/lottie.dart';

class CustomSliderOnBoarding extends GetView<OnBoardingControllerImp> {
  const CustomSliderOnBoarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
        controller: controller.pageController,
        onPageChanged: (val){
          controller.onPageChanged(val) ;
        },
        itemCount: onBoardingList.length,
        itemBuilder: (context, i) => Column(
          children: [
            const SizedBox(height: 150),
            Lottie.asset(
              onBoardingList[i].image!,
              width: 260,
              //height: 250,
              fit: BoxFit.fill,
            ),
            const SizedBox(height: 40),
            Text(onBoardingList[i].title!,
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22, color: AppColor.black)),
            const SizedBox(height: 30,),
            Container(
                width: double.infinity,
                alignment: Alignment.center,
                child: Text(
                  onBoardingList[i].body!,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    height: 1.5,
                    color: AppColor.grey,
                    //fontWeight: FontWeight.w300,
                    fontSize: 15),
                )),
          ],
        ));
  }
}