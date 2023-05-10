import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:glaregroup/controller/address/adddetails_controller.dart';
import 'package:glaregroup/core/class/handlingdataview.dart';
import 'package:glaregroup/core/constant/color.dart';
import 'package:glaregroup/view/wedgit/address/custombuttonaddaddress.dart';
import 'package:glaregroup/view/wedgit/auth/customtextformauth.dart';
import 'package:glaregroup/view/wedgit/auth/logoauth.dart';

class AddressAddDetails extends StatelessWidget {
  const AddressAddDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AddressAddDetailsController controller = Get.put(AddressAddDetailsController());

    return Scaffold(
      appBar: AppBar(
        title:  Text("96".tr, style: const TextStyle(color: AppColor.black),),
        centerTitle: true,
        backgroundColor: AppColor.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(15),
        child: GetBuilder<AddressAddDetailsController>(
          builder: ((controller) => HandlingDataView(
              statusRequest: controller.statusRequest,
              widget:
              ListView(
                children: [
                  const SizedBox(height: 10),
                  Center(child: Text("97".tr,style: const TextStyle(fontSize: 20, color: AppColor.primaryColor),)),
                  const SizedBox(height: 50),
                  const AddAddressPhoto(),
                  const SizedBox(height: 50),
                  CustomTextFormAuth(
                      hinttext: "98".tr,
                      labeltext: "99".tr,
                      iconData: Icons.location_city,
                      mycontroller: controller.city,
                      valid: (val){},
                      isNumber: false
                  ),
                  CustomTextFormAuth(
                      hinttext: "100".tr,
                      labeltext: "101".tr,
                      iconData: Icons.streetview_rounded,
                      mycontroller: controller.street,
                      valid: (val){},
                      isNumber: false
                  ),
                  CustomTextFormAuth(
                      hinttext: "102".tr,
                      labeltext: "103".tr,
                      iconData: Icons.drive_file_rename_outline,
                      mycontroller: controller.name,
                      valid: (val){},
                      isNumber: false
                  ),
                  const SizedBox(height: 150),
                  CustomButtonAddAddress(
                    text: "104".tr,
                    onPressed: (){
                      controller.addAddress();
                    },
                  )
                ],
              ))) ,
        ) ,
          )
          );
  }
}
