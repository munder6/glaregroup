import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:glaregroup/controller/cart_controller.dart';
import 'package:glaregroup/core/constant/routes.dart';
import 'package:glaregroup/view/wedgit/cart/custombuttoncoupon.dart';

import '../../../core/constant/color.dart';
import 'custombuttomnavigtionbar.dart';

class CustomBottomNavigationBarCart extends GetView<CartController> {
  final TextEditingController controllercoupon;
  final String price;
  final String discount;
  final String totalPrice;
  final void Function()? onPressedApply;
  const CustomBottomNavigationBarCart({Key? key, required this.price, required this.discount, required this.totalPrice, required this.controllercoupon, this.onPressedApply}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child : Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            GetBuilder<CartController>(
              builder: (controller) => controller.couponname == null ?
                Container(
              padding: EdgeInsets.all(10),
              child: Row(
                children:  [
                  Expanded(
                    flex : 2,
                    child: TextField(
                      controller: controllercoupon,
                      decoration: InputDecoration(
                          isDense: true,
                          contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                          hintText: '118'.tr,
                          hintStyle: TextStyle(fontSize: 13, color: AppColor.grey),

                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)
                          )
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    flex: 1,
                    child: CustomButtonCoupon(
                      textbutton: '119'.tr,
                      onPressed: onPressedApply,
                    ),
                  )
                ],
              ),
            ) : Container(
                  child: Text("Coupon Applied : ${controller.couponname!}",
                    style: const TextStyle(color: AppColor.primaryColor , fontSize: 20),
                  )
              ),
            ),
           const SizedBox(height: 20),
            Card(
              elevation: 10,
              shadowColor: AppColor.black.withOpacity(0.5),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child:  Text("121".tr, style: TextStyle(fontSize: 18),)),
                      Container(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Text("$price \$", style: const TextStyle(fontSize: 18)))
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child:  Text("122".tr, style: TextStyle(fontSize: 18),)),
                      Container(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Text("$discount", style: const TextStyle(fontSize: 18)))
                    ],
                  ),
                  const Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child:  Text("123".tr, style: TextStyle(fontSize: 18,color: AppColor.primaryColor),)),
                      Container(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Text("$totalPrice \$", style: const TextStyle(fontSize: 18, color: AppColor.primaryColor)))
                    ],
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
            Card(
              elevation: 10,
              shadowColor: AppColor.black.withOpacity(0.5),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)
              ),
                child: PlaceOrderButton(textbutton: '124'.tr, onPressed: () {
                  //Get.toNamed(AppRoute.checkout);
                  controller.goToPageCheckout();
                },),
            )
          ],
        )
    );
  }
}
