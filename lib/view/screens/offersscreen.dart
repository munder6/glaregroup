import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:glaregroup/controller/favorite_controller.dart';
import 'package:glaregroup/controller/offers_controller.dart';
import 'package:glaregroup/core/class/handlingdataview.dart';
import 'package:glaregroup/core/constant/routes.dart';
import 'package:glaregroup/view/wedgit/offers/customlistitemsoffers.dart';
import 'package:glaregroup/view/wedgit/home/customappbar.dart';

import 'homescreen.dart';

class OffersScreen extends StatelessWidget {
  const OffersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    OffersController controller = Get.put(OffersController());
    FavoriteController controllerFav = Get.put(FavoriteController());
    return GetBuilder<OffersController>(builder: (controller) => Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      child: ListView(
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
          const SizedBox(height: 20),
         !controller.isSearch ? HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: controller.data.length,
              itemBuilder: (context, index) => CustomListItemsOffers(
                itemsModel: controller.data[index],
              ),
            ),
          ) : ListItemsSearch(listdatamodel: controller.listdata)
        ],
      ),
    )
    );
  }
}
