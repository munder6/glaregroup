import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:glaregroup/core/constant/routes.dart';

import '../../../controller/productdetails_controller.dart';
import '../../../core/constant/color.dart';



class PriceAndAmount extends StatelessWidget {

  final void Function()? onAdd;
  final void Function()? onRemove;
  final String price;
  final String count;

  const PriceAndAmount({Key? key,required this.onAdd,required this.onRemove,required this.price,required this.count}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ProductDetailsControllerImp controller = Get.put(ProductDetailsControllerImp());
    return  Container(
      color: Colors.transparent,
      padding: EdgeInsets.all(15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("$price \$", style: TextStyle(color: AppColor.black, fontSize: 22),),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.black),
            ),
            child: Row(
              children: [
                Container(
                    width: 35,
                    height: 35,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                       // color: AppColor.black,
                        borderRadius: BorderRadius.circular(20),
                        //border: Border.all(color: AppColor.white,)
                    ),
                    child: IconButton(
                        onPressed: onAdd , icon: const Icon(Icons.add, size: 18,color: AppColor.black,))),
                const SizedBox(width: 3,),
                Container(
                    width: 40,
                    height: 40,
                    alignment: Alignment.center,
                    child:  Text(count,style: const TextStyle(fontSize: 16),)),
                const SizedBox(width: 3,),
                Container(
                    width: 35,
                    height: 35,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        //color: AppColor.black,
                        borderRadius: BorderRadius.circular(20),
                       // border: Border.all(color: AppColor.white,)
                    ),
                    child: IconButton(onPressed: onRemove, icon: const Icon(Icons.remove , size: 18,color: AppColor.black,))),
              ],
            ),
          ),
          Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.red),
            ),
            height: 50,
            width: 50,
            child: Center(child: IconButton(onPressed: () {
              Get.toNamed(AppRoute.cart);
            },icon: Icon(Icons.shopping_cart_outlined, color: Colors.white),)),
          ),
        ],
      ),
    );
  }
}
