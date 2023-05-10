import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:glaregroup/controller/myfavorite_controller.dart';
import 'package:glaregroup/core/class/handlingdataview.dart';
import 'package:glaregroup/view/screens/homescreen.dart';
import '../../core/constant/routes.dart';
import '../wedgit/home/customappbar.dart';
import '../wedgit/myfavorite/customlistfavorite.dart';



class MyFavorite extends StatelessWidget {
  const MyFavorite({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(MyFavoriteController());
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        margin: const EdgeInsets.only(top: 10),
        child: GetBuilder<MyFavoriteController>(builder: ((controller) => ListView(
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
            SizedBox(height: 20),
            HandlingDataView(
              statusRequest: controller.statusRequest,
              widget:  !controller.isSearch ? GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: controller.data.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.76,
                ),
                itemBuilder: (context, index){
                  return CustomListFavoriteItems(
                    itemsModel: controller.data[index],
                  );
                },
              ) : ListItemsSearch(listdatamodel: controller.listdata),
            )
          ],
        )
        )
        ),
      ),
    );
  }
}
