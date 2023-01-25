import 'package:flutter/material.dart';

import '../../../controller/productdetails_controller.dart';
import 'package:get/get.dart';

import '../../../core/constant/color.dart';

class SubItems extends StatelessWidget {
  const SubItems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ProductDetailsControllerImp controller = Get.put(ProductDetailsControllerImp());
    return Row(
      children: [
        ...List.generate(controller.subitems.length, (index) =>   InkWell(
          onTap: () {},
          child:
          Container(
            margin: EdgeInsets.only(right: 8),
            alignment: Alignment.center,
            height: 40,
            width: 77,
            decoration: BoxDecoration(
              color: controller.subitems[index]['active'] == "1" ?  AppColor.black : Colors.white ,
              border: Border.all(color: AppColor.black, width: 1),
              borderRadius: BorderRadius.circular(15),
            ),
            child:  Text(controller.subitems[index]['name'],
              style: TextStyle(color: controller.subitems[index]['active'] == "1" ?  Colors.white : AppColor.black, fontWeight: FontWeight.bold),),
            //child: ,
          ),
        ),)
      ],
    );
  }
}
