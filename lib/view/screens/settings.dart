import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:glaregroup/core/constant/color.dart';
import 'package:glaregroup/core/constant/imageasset.dart';
import 'package:glaregroup/core/constant/routes.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../controller/settings_controller.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SettingsController controller = Get.put(SettingsController());
    return Container(
      child: ListView(
        children: [
          Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.center,
            children: [
              Container(
                height: Get.width / 3,
                color: AppColor.primaryColor,
              ),
              Positioned(
                  top: Get.width / 7.5,
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: AppColor.white,
                      borderRadius: BorderRadius.circular(100)
                    ),
                    child: CircleAvatar(
                      radius:  80,
                      backgroundColor: Colors.grey[100],
                      backgroundImage: const AssetImage(AppImageAsset.logo),
              ),
                  )),
            ],
          ),
          const SizedBox(height: 150),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Card(
              child: Column(
                children:  [
                  ListTile(
                    onTap: (){},
                    title:  Text("112".tr),
                    trailing: Switch(onChanged: (val){},value: false,),
                  ),
                //  const Divider(),
                  ListTile(
                    onTap: (){
                      Get.toNamed(AppRoute.ordersPending);
                    },
                    title:  Text("106".tr),
                    trailing: const Icon(EvaIcons.carOutline),
                  ),
                  ListTile(
                    onTap: (){
                      Get.toNamed(AppRoute.ordersArchive);
                    },
                    title:  Text("113".tr),
                    trailing: const Icon(EvaIcons.archiveOutline),
                  ),
                  ListTile(
                    onTap: (){
                      Get.toNamed(AppRoute.addressView);
                    },
                    title:  Text("114".tr),
                    trailing: const Icon(EvaIcons.navigation2Outline),
                  ),
                 // const Divider(),
                  ListTile(
                    onTap: (){},
                    title:  Text("115".tr),
                    trailing: const Icon(EvaIcons.alertCircleOutline),
                  ),
                 // const Divider(),
                  ListTile(
                    onTap: ()async{
                     await launchUrl(Uri.parse("tel:+970599987676"));
                    },
                    title:  Text("116".tr),
                    trailing: const Icon(EvaIcons.phoneCallOutline),
                  ),
                //  const Divider(),
                  ListTile(
                    onTap: (){
                      controller.logout();
                    },
                    title:  Text("117".tr),
                    trailing: const Icon(EvaIcons.logOutOutline),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
