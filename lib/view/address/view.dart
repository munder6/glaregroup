import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:glaregroup/controller/address/view_controller.dart';
import 'package:glaregroup/core/class/handlingdataview.dart';
import 'package:glaregroup/core/constant/color.dart';
import 'package:glaregroup/core/constant/routes.dart';
import 'package:glaregroup/data/model/addressmodel.dart';

class AddressView extends StatelessWidget {
  const AddressView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AddressViewController controller = Get.put(AddressViewController());
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(AppRoute.addressAdd);
        },
        child: Icon(Icons.add, color: AppColor.white,),
      ),
      appBar: AppBar(
        title:  Text("105".tr, style: const TextStyle(color: AppColor.black),),
        centerTitle: true,
        backgroundColor: AppColor.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: GetBuilder<AddressViewController>(builder: (controller) => HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: ListView.builder(
              itemCount: controller.data.length,
              itemBuilder: (context, i) {
              return CardAddress(addressModel: controller.data[i],
                onPressedDelete: (){
                controller.deleteData(controller.data[i].addressId!);
                },
              );
              },
            ))),
      ),
    );
  }
}

class CardAddress extends StatelessWidget {
  final void Function()? onPressedDelete;
  final AddressModel addressModel;
  const CardAddress({Key? key, required this.addressModel, this.onPressedDelete}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:  const EdgeInsets.symmetric(horizontal: 8),
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Column(
        children: [
          InkWell(
            onTap: (){},
            child: Card(
              elevation: 10,
              shadowColor: AppColor.black.withOpacity(0.5),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)
              ),
              child: Container(
                padding: const EdgeInsets.all(10),
                child: ListTile(
                  trailing:  IconButton(
                      onPressed: onPressedDelete,
                      icon: const Icon(Icons.delete, color: AppColor.red,
                      )
                  ),
                  title: Text(addressModel.addressName!),
                  subtitle: Text("${addressModel.addressCity}\n${addressModel.addressStreet}"),

                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

