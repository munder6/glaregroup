import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:glaregroup/core/constant/imageasset.dart';
import '../../../controller/home_controller.dart';
import '../../../core/constant/color.dart';
import '../../../core/functions/translatedatabase.dart';
import '../../../data/model/itemsmodel.dart';
import '../../../linkapi.dart';



class ListItemsHome extends GetView<HomeControllerImp> {
  const ListItemsHome({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {

    return  SizedBox(
        height: 280,
        child :
        ListView.builder(
            itemCount: controller.items.length ,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context , i) {
              return ItemsHome(itemsModel: ItemsModel.fromJson(controller.items[i]));
            }
        )
    );
  }
}


class ItemsHome extends GetView<HomeControllerImp> {
  final ItemsModel itemsModel ;
  const ItemsHome({Key? key, required this.itemsModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
        children : [
          Container(
            height: 400,
            width: 220,
            child: InkWell(
              onTap: (){
              controller.goToPageProductDetails(itemsModel);
              },
              child: Card(
                color: Colors.white,
                //elevation: 10,
                shadowColor: AppColor.white.withOpacity(0.5),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)
                ),
                 margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                child: Stack(
                  children: [
                    Center(
                      //padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children :[
                            CachedNetworkImage(imageUrl :"${AppLink.imageItems}/${itemsModel.itemsImage!}", height: 90, fit: BoxFit.fill,),
                            const SizedBox(height: 10),
                            Text(translateDtaBase(
                                itemsModel.itemsNameAr,itemsModel.itemsName),
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                  color: AppColor.black, fontSize: 18, fontWeight: FontWeight.bold)
                            ),
                            const SizedBox(height: 10),
                            Text("137".tr , style: TextStyle(color: Colors.deepOrange, fontSize: 16),),
                            const SizedBox(height: 20),
                             Text("${itemsModel.itemsPriceDiscount}\$", style: const TextStyle(color: AppColor.black, fontWeight: FontWeight.normal, fontSize: 13),)
                          ]
                      ),
                    ),
                    if(itemsModel.itemsDescount != "0") Positioned(
                        top: 10,
                        right: 10,
                        child: Image.asset(AppImageAsset.sale, width: 50,)),

                  ],
                ),
              ),
            ),
          ),
        ],
    );
}
}

