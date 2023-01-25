import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:glaregroup/controller/homescreen_controller.dart';
import 'package:glaregroup/core/constant/color.dart';
import '../wedgit/home/custombottomappbarhome.dart';



class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(HomeScreenControllerImp());
    return GetBuilder<HomeScreenControllerImp>(builder: (controller) => Scaffold(
      //backgroundColor: Colors.amber,
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColor.secondColor,
        onPressed: (){},
        child: const Icon(Icons.shopping_basket_outlined),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: const CustomBottomAppBarHome(),
      body: controller.listPage.elementAt(controller.currentpage) ,
      // bottomNavigationBar: ,
    ));
  }
}
