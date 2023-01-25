import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:glaregroup/controller/home_controller.dart';

import '../../../core/constant/color.dart';


class CustomCardHome extends GetView<HomeControllerImp> {

  final String title;
  final String body;


  const CustomCardHome({Key? key, required this.title, required this.body}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: const EdgeInsets.symmetric( vertical: 15),
      child: Stack(
        children: [
          Container(
            alignment: Alignment.center,
            height: 150,
            decoration: BoxDecoration(
                color: AppColor.primaryColor,
                borderRadius: BorderRadius.circular(10)
            ),
            child:  ListTile(
              title: Text(title , style: TextStyle(color: AppColor.white,fontSize: 15),),
              subtitle:Text(body, style: TextStyle(color: AppColor.white,fontSize: 25),) ,
            ),
          ),
          Positioned(
            bottom: -20,
            right: controller.lang == "en" ? -20 : null,
            left: controller.lang == "ar" ? -20 : null,
            child: Container(
              height: 160,
              width: 160,
              decoration: BoxDecoration(
                  color: AppColor.secondColor,
                  borderRadius: BorderRadius.circular(160)
              ),
            ),
          )
        ],
      ),
    );
  }
}
