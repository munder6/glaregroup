
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:glaregroup/controller/home_controller.dart';
import 'package:glaregroup/controller/notification_controller.dart';
import 'package:glaregroup/core/class/handlingdataview.dart';
import 'package:glaregroup/core/constant/color.dart';
import 'package:jiffy/jiffy.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeControllerImp homeControllerImp = Get.put(HomeControllerImp());
    NotificationController controller = Get.put(NotificationController());
    return Container(
      child: GetBuilder<NotificationController>(
        builder: (controller) => HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: Container(
              padding: const EdgeInsets.all(10),
              child: ListView(
                children: [
                  const SizedBox(height: 20,),
                  Center(child: Text("125".tr, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: AppColor.primaryColor))),
                  const SizedBox(height: 20,),
                  ...List.generate(
                      controller.data.length,
                          (index) => Card(
                        elevation: 10,
                        shadowColor: AppColor.black.withOpacity(0.5),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)
                        ),
                        child:  Stack(
                          children: [
                           ListTile(
                              leading: const Icon(EvaIcons.bellOutline, size: 30,),
                              title: Text(controller.data[index]['notification_title']),
                              subtitle: Text(controller.data[index]['notification_body']),
                            ),
                          Positioned(
                              right: homeControllerImp.lang == "en" ? -16 : 280,
                              left: homeControllerImp.lang == "ar" ? 16 : 280,
                              top: 16,
                              child:Text(Jiffy(controller.data[index]['notification_datetime'], "yyyy-MM-dd").fromNow(), style: const TextStyle(color: AppColor.red),),
                          ) ],
                        ),
                        ),
                      )
                ],
              ),
            )),
      ),
    );
  }
}
