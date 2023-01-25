import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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


class ItemsHome extends StatelessWidget {

  final ItemsModel itemsModel ;

  const ItemsHome({Key? key, required this.itemsModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
        children : [
          SizedBox(
            height: 260,
            width: 190,
            child: InkWell(
              onTap: (){},
              child: Card(
                elevation: 10,
                shadowColor: AppColor.black.withOpacity(0.5),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)
                ),
                 margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children :[
                        CachedNetworkImage(imageUrl :"${AppLink.imageItems}/${itemsModel.itemsImage!}", height: 130, fit: BoxFit.fill,),
                        const SizedBox(height: 8),
                        Text(translateDtaBase(
                            itemsModel.itemsNameAr,itemsModel.itemsName),
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              color: AppColor.primaryColor, fontSize: 16)
                          ,
                        ),
                        const SizedBox(height: 3,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("53".tr, textAlign: TextAlign.center, style: TextStyle(fontSize: 12),),
                            Row(children: [
                              ...List.generate(5, (index) => const Icon(Icons.star, size: 14,color: Colors.yellow,))
                            ],)
                          ],),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("54".tr),
                            Text("${itemsModel.itemsPrice}\$", style: TextStyle(color: AppColor.red, fontSize: 15),),
                            IconButton(
                                onPressed: (){},
                                icon: const Icon(Icons.favorite_outline,)
                            )
                          ],
                        )

                      ]
                  ),
                ),
              ),
            ),
          ),
          // Container(
          //   height: 220,
          //     decoration : BoxDecoration(
          //         border: Border.all(color: AppColor.secondColor.withOpacity(0.05), width: 1),
          //         color : AppColor.white,
          //         borderRadius: BorderRadius.circular(20),
          //         boxShadow:  [
          //           BoxShadow(
          //               color: AppColor.grey.withOpacity(0.2),
          //               blurRadius: 7,
          //               spreadRadius: 0.1,
          //               offset: const Offset(5, 5)
          //           )
          //         ]
          //     ) ,
          //     padding : const EdgeInsets.symmetric(horizontal: 10, vertical: 10) ,
          //     margin  : const EdgeInsets.symmetric(horizontal: 2, ) ,
          //     child: Image.network(
          //       "${AppLink.imageItems}/${itemsModel.itemsImage}",
          //       alignment: Alignment.topCenter,
          //       height: 150,
          //       width: 150,
          //       fit: BoxFit.scaleDown,
          //     ),
          // ),

          // Column(
          //   mainAxisAlignment: MainAxisAlignment.start,
          //   children: [
          //     Container(
          //       decoration : BoxDecoration(
          //         //color: AppColor.secondColor.withOpacity(0.4),
          //         borderRadius: BorderRadius.circular(20),
          //       ) ,
          //       margin  : const EdgeInsets.symmetric(horizontal: 5) ,
          //       height: 180,
          //       width: 180,
          //       child :
          //       Container(
          //         margin: const EdgeInsets.symmetric(horizontal: 1, vertical: 4),
          //         child:  ListTile(
          //           minVerticalPadding: 160,
          //           title :  Text("${itemsModel.itemsName}", style:  TextStyle(color: AppColor.primaryColor, fontWeight: FontWeight.bold)),
          //           subtitle: Text("Tab To More", style:  TextStyle(color: AppColor.greydark, fontSize: 10),),
          //         ),
          //       ) ,
          //     ),
          //   ],
          // ),
        ],
    );
}
}

