import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/productdetails_controller.dart';
import '../../../core/constant/color.dart';
import '../../../linkapi.dart';



class TopPage extends StatelessWidget {
  const TopPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ProductDetailsControllerImp controller = Get.put(ProductDetailsControllerImp());
    return   Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: 250,
          decoration:   BoxDecoration(
            color: AppColor.secondColor,
            borderRadius: const BorderRadius.vertical(bottom: Radius.circular(30)),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
        ),

        Positioned(
          top: 100,
          right: 20,
          left: 20,
          child:

          Hero(
            tag: "${controller.itemsModel.itemsId}",
            child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: CachedNetworkImage(
                  imageUrl: "${AppLink.imageItems}/${controller.itemsModel.itemsImage!}",
                  height: 250,
                  fit: BoxFit.scaleDown,
                )),
          ),
        )
      ],
    );
  }
}
