import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:glaregroup/controller/cart_controller.dart';
import 'package:glaregroup/core/class/handlingdataview.dart';
import 'package:glaregroup/core/constant/color.dart';
import '../wedgit/cart/cartitemscount.dart';
import '../wedgit/cart/custom_bottom_navigationbar_cart.dart';
import '../wedgit/cart/itemscardcart.dart';

class Cart extends StatelessWidget {

  const Cart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   CartController cartController = Get.put(CartController());
    return Scaffold(
      bottomNavigationBar:
      GetBuilder<CartController>(builder: (controller) =>
          CustomBottomNavigationBarCart(
            controllercoupon: controller.controllercoupon! ,
            onPressedApply: (){
              controller.checkCoupon();
            },
            price: '${cartController.priceorders}',
            discount: '${controller.discountcoupon}%',
            totalPrice: '${controller.getTotalPrice()}',
          ),
      ),
      backgroundColor: Colors.white,
      appBar: AppBar(
        title:  Text("107".tr, style: const TextStyle(color: AppColor.black),),
        centerTitle: true,
        backgroundColor: AppColor.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: GetBuilder<CartController>(
        builder: ((controller) =>
            HandlingDataView(
                statusRequest: controller.statusRequest,
                widget: ListView(
                  children: [
                    const SizedBox(height: 10),
                     CartItemsCount(message: "You Have ${cartController.totalcountitems} Items In Cart",),
                    Container(
                      padding: const EdgeInsets.all(10),
                      child: Column(children: [
                        ...List.generate(cartController.data.length, (index) => ItemsCardCart(
                          name: '${cartController.data[index].itemsName}',
                          price: '${cartController.data[index].itemsprice} \$',
                          count: '${cartController.data[index].countitems}',
                          imagename: '${cartController.data[index].itemsImage}',
                          onAdd: () async { await cartController.add(cartController.data[index].itemsId!); cartController.refreshPage(); },
                          onRemove: () async { await cartController.delete(cartController.data[index].itemsId!); cartController.refreshPage();},
                        )
                        )
                      ]),
                    )
                  ],
                )
            )
        ),
      ),
    );
  }
}
