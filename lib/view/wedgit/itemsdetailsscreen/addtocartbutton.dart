import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/productdetails_controller.dart';
import '../../../core/constant/color.dart';
import '../../../core/constant/routes.dart';


class AddToCartButton extends StatelessWidget {
  const AddToCartButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ProductDetailsControllerImp controller = Get.put(ProductDetailsControllerImp());
    return Container(
      //margin: EdgeInsets.all(120),
      decoration:  BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              //offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
          color: AppColor.secondColor,
         // borderRadius: const BorderRadius.all(Radius.circular(0))
      ),
      height: 50,
      child: MaterialButton(onPressed: (){
        Get.toNamed(AppRoute.cart);
      },
        child: Text("55".tr, style: const TextStyle(color: AppColor.white),),
      ),
    );
  }
}
