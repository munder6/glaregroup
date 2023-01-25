import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:glaregroup/controller/test_controller.dart';
import 'package:glaregroup/core/class/handlingdataview.dart';
import 'package:glaregroup/core/constant/color.dart';


class TestView extends StatelessWidget {
  const TestView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(TestController());

    return Scaffold(
      appBar: AppBar(
        title: const Text("Title"),
        backgroundColor: AppColor.primaryColor,
      ),
      body: GetBuilder<TestController>(builder: (controller) {

        return HandlingDataView(

          statusRequest: controller.statusRequest,
          widget: ListView.builder(
              itemCount: controller.data.length,
              itemBuilder: (context , index){
              return Text("${controller.data}");
            }
        ),  );

      },),
    );
  }
}
