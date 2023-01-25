import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:glaregroup/controller/home_controller.dart';
import 'package:glaregroup/core/constant/color.dart';
import 'package:glaregroup/core/constant/routes.dart';
import '../../core/class/handlingdataview.dart';
import '../wedgit/home/customappbar.dart';
import '../wedgit/home/customcardhome.dart';
import '../wedgit/home/customcategorishome.dart';
import '../wedgit/home/customtitlehome.dart';
import '../wedgit/home/listitemshome.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(HomeControllerImp());
    return  GetBuilder<HomeControllerImp>(
        builder: (controller) => HandlingDataView(statusRequest: controller.statusRequest , widget: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          margin: const EdgeInsets.only(top: 10),
          child: ListView(
            children: [
              CustomAppBar(
                onPressedIconFavorite: (){
                  Get.toNamed(AppRoute.myFavorite);
                },
                onPressedIcon: (){
                 },
                titleappbar: "49".tr,
              ),
              const CustomCardHome(
                title: 'A Summer Sale', body: 'Cash Back 50%',
              ),
              Text("51".tr, style: const TextStyle(color: AppColor.secondColor,fontSize: 18),),
              const SizedBox(height: 10,),
              const CustomCatHome(),
              CustomTitleHome(title: "50".tr,),
              const SizedBox(height: 2,),
              const ListItemsHome(),
              const SizedBox(height: 2,),
              CustomTitleHome(title: "52".tr,),
              const ListItemsHome(),
                ],
              ),
          ),
        ),
    );
  }
}
