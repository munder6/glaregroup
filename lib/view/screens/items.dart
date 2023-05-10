import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:glaregroup/controller/favorite_controller.dart';
import 'package:glaregroup/core/class/handlingdataview.dart';
import 'package:glaregroup/view/screens/homescreen.dart';
import '../../controller/items_controller.dart';
import '../../core/constant/routes.dart';
import '../../data/model/itemsmodel.dart';
import '../wedgit/home/customappbar.dart';
import '../wedgit/items/customlistitems.dart';
import '../wedgit/items/listcategoriesitem.dart';

class Items extends StatelessWidget {
  const Items({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ItemsControllerImp controller = Get.put(ItemsControllerImp());
    FavoriteController controllerFav = Get.put(FavoriteController());
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(15),
        child:  ListView(
                  children: [
                    CustomAppBar(
                      mycontroller: controller.search!,
                      onPressedIconFavorite: (){
                        Get.toNamed(AppRoute.myFavorite);
                      },
                      onPressedIcon: (){
                        controller.onSearchItems();
                      },
                      titleappbar: "49".tr,
                      onChanged: (val ) {
                        controller.checkSearch(val);
                      },
                    ),
                    const SizedBox(height: 12),
                    const CustomCatItems(),
                     GetBuilder<ItemsControllerImp>(builder: (controller) =>
                      HandlingDataView(
                       statusRequest: controller.statusRequest,
                        widget:
                     !controller.isSearch? GridView.builder(
                         shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: controller.data.length,
                         gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                         childAspectRatio: 0.75,
                          crossAxisCount: 2),

                             itemBuilder: (BuildContext context , index){
                           controllerFav.isFavorite[controller.data[index]['items_id']] = controller.data[index]['favorite'];
                         return CustomListItems(itemsModel: ItemsModel.fromJson(controller.data[index]),
                         );
    },
                ) : ListItemsSearch(listdatamodel: controller.listdata)))])),
        );

  }
}
