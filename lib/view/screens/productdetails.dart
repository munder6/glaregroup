import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:glaregroup/controller/productdetails_controller.dart';
import 'package:glaregroup/core/class/handlingdataview.dart';
import 'package:glaregroup/core/constant/color.dart';
import '../../core/functions/translatedatabase.dart';
import '../wedgit/itemsdetailsscreen/addtocartbutton.dart';
import '../wedgit/itemsdetailsscreen/optionsselect.dart';
import '../wedgit/itemsdetailsscreen/priceandamount.dart';
import '../wedgit/itemsdetailsscreen/toppage.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ProductDetailsControllerImp controller = Get.put(ProductDetailsControllerImp());
    return Scaffold(
      bottomNavigationBar:
      const AddToCartButton(),
      body: GetBuilder<ProductDetailsControllerImp>(builder: (controller) => HandlingDataView(
          statusRequest: controller.statusRequest,
          widget: ListView(
            children: [
              const TopPage(),
              const SizedBox(height: 100,),
              Container(
                padding: const EdgeInsets.all( 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(translateDtaBase(
                        controller.itemsModel.itemsNameAr,controller.itemsModel.itemsName),
                      style: Theme.of(context).textTheme.headline2!.copyWith(color: AppColor.primaryColor),
                    ),
                    const SizedBox(height: 5),
                    PriceAndAmount(
                      price: "${controller.itemsModel.itemsPriceDiscount}" ,
                      count: "${controller.countitems}" ,
                      onAdd: () {
                        controller.add();
                      },
                      onRemove: () {
                        controller.remove();
                      },
                    ),
                    const SizedBox(height: 5),
                    Text(
                        translateDtaBase(
                            controller.itemsModel.itemsDescAr,controller.itemsModel.itemsDesc),
                        style: Theme.of(context).textTheme.bodyText2),
                    const SizedBox(height: 15),
                    Text("56".tr,
                        style: Theme.of(context).textTheme.headline2),
                    const SizedBox(height: 10,),
                    const SubItems(),

                  ],
                ),
              )
            ],
          )
      )),
    );
  }
}
