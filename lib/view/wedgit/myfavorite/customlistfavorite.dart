import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:glaregroup/controller/myfavorite_controller.dart';
import 'package:glaregroup/data/model/myfavoritemodel.dart';
import '../../../core/constant/color.dart';
import '../../../core/functions/translatedatabase.dart';
import '../../../linkapi.dart';



class CustomListFavoriteItems extends GetView<MyFavoriteController> {
  final MyFavoriteModel itemsModel;
  const CustomListFavoriteItems( {Key? key, required this.itemsModel, }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(20),
      splashColor: AppColor.primaryColor.withOpacity(0.2),
      onTap: (){
        //controller.goToPageProductDetails(itemsModel);
      },
      child: Card(
        elevation: 10,
        shadowColor: AppColor.black.withOpacity(0.5),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20)
        ),
        // margin: EdgeInsets.symmetric(horizontal: 40, vertical: 30),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, ),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children :[
                Hero(
                    tag: "${itemsModel.itemsId}",
                    child: CachedNetworkImage(imageUrl :"${AppLink.imageItems}/${itemsModel.itemsImage!}", height: 130, fit: BoxFit.fill,)),
                const SizedBox(height: 8),
                Text(translateDtaBase(
                    itemsModel.itemsNameAr,itemsModel.itemsName),
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      color: AppColor.primaryColor, fontSize: 16),
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
                      onPressed: (){
                        controller.deleteFromFavorite(itemsModel.favoriteId!);
                      },
                      icon:  Icon(Icons.delete_outline, color: Colors.red),
                    )
                  ],
                )

              ]
          ),
        ),
      ),
    );
  }
}
