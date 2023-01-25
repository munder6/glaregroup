import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
    return  Row(
      children: [
        Text("54".tr, style: const TextStyle(fontSize: 18),),
        const SizedBox(width: 5,),
        Text("$price \$", style: TextStyle(color: AppColor.red, fontSize: 18),),
        const Spacer(),
        Row(
          children: [
            Container(
                width: 35,
                height: 35,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: AppColor.black,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: AppColor.white,
                    )),
                child: IconButton(
                    onPressed: onAdd , icon: const Icon(Icons.add, size: 18,color: AppColor.white,))),
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
                    color: AppColor.black,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: AppColor.white,
                    )),
                child: IconButton(onPressed: onRemove, icon: const Icon(Icons.remove , size: 18,color: AppColor.white,))),
          ],
        )
      ],
    );
  }
}
