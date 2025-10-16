import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:glaregroup/core/class/handlingdataview.dart';
import 'package:glaregroup/core/constant/color.dart';
import 'package:glaregroup/core/functions/translatedatabase.dart';
import 'package:glaregroup/view/wedgit/itemsdetailsscreen/priceandamount.dart';
import 'package:glaregroup/view/wedgit/itemsdetailsscreen/toppage.dart';
import '../controller/productdetails_controller.dart';


class ProDetailsTest extends StatelessWidget {
  const ProDetailsTest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ProductDetailsControllerImp controller = Get.put(ProductDetailsControllerImp());
    return Scaffold(
      body: GetBuilder<ProductDetailsControllerImp>(
        builder:(controller) => HandlingDataView(
         statusRequest: controller.statusRequest,
         widget: Container(
          padding: EdgeInsets.all(15),
          decoration:  BoxDecoration(
            gradient: LinearGradient(tileMode: TileMode.repeated,begin: Alignment.centerLeft, end: Alignment.centerRight, colors: [
              AppColor.secondColor.withOpacity(0.3),
              AppColor.white
            ])
          ),
          child: ListView(
           children: [
             Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 Container(
                   alignment: Alignment.center,
                   decoration: BoxDecoration(
                     borderRadius: BorderRadius.circular(12),
                     border: Border.all(color: Colors.black),
                   ),
                   height: 45,
                   width: 45,
                   child: Center(child: IconButton(onPressed: () => Navigator.of(context).pop(),icon: Icon(Icons.arrow_back_ios_new, color: Colors.black),)),
                 ),


               ],
             ),
             const TopPage(),
             Container(
               padding: const EdgeInsets.all( 20),
               child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                       Text(translateDtaBase(
                           controller.itemsModel.itemsNameAr,controller.itemsModel.itemsName),
                         style: Theme.of(context).textTheme.displayMedium!.copyWith(color: AppColor.primaryColor),
                       ),
                       Container(
                         alignment: Alignment.center,
                         decoration: BoxDecoration(
                           color: Colors.white,
                           borderRadius: BorderRadius.circular(12),
                           border: Border.all(color: Colors.red),
                         ),
                         height: 45,
                         width: 45,
                         child: Center(child: IconButton(onPressed: () {  },icon: Icon(Icons.favorite_border, color: Colors.red),)),
                       ),
                     ],
                   ),
                   const SizedBox(height: 5),
                   // Text(
                   //     translateDtaBase(
                   //         controller.itemsModel.categoriesNameAr,controller.itemsModel.categoriesName),
                   //     style: Theme.of(context).textTheme.bodyText2),
                   const SizedBox(height: 20),
                   Text(
                       translateDtaBase(
                           controller.itemsModel.itemsDescAr,controller.itemsModel.itemsDesc),
                       style: Theme.of(context).textTheme.bodyMedium),
                   const SizedBox(height: 50),
                   // Text("56".tr,
                   //     style: Theme.of(context).textTheme.headline2),
                   const SizedBox(height: 10,),
                  // const SubItems(),
                   SizedBox(height: 130),
                   PriceAndAmount(
                     price: "${controller.itemsModel.itemsPriceDiscount}" ,
                     count: "${controller.countitems}" ,
                     onAdd: () {
                       controller.add();
                     },
                     onRemove: () {
                       controller.remove();
                     },
                   )


                 ],
               ),
             )

           ],
          )
        ),
      ),
    ));
  }
}
