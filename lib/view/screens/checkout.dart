import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:glaregroup/controller/checkout_controller.dart';
import 'package:glaregroup/core/class/handlingdataview.dart';
import 'package:glaregroup/core/constant/color.dart';
import 'package:glaregroup/core/constant/imageasset.dart';
import 'package:glaregroup/core/constant/routes.dart';
import 'package:glaregroup/view/wedgit/checkout/addresschoosecheckout.dart';
import 'package:glaregroup/view/wedgit/checkout/cardpaymentmethod.dart';
import 'package:glaregroup/view/wedgit/checkout/custombuttoncheckout.dart';
import 'package:glaregroup/view/wedgit/checkout/deliveymethodcardchecout.dart';

class CheckOutScreen extends StatelessWidget {
  const CheckOutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CheckoutController controller = Get.put(CheckoutController());
    return Scaffold(
      appBar: AppBar(
        title:  Text("108".tr, style: const TextStyle(color: Colors.black),),
        centerTitle: true,
        backgroundColor: AppColor.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
        child: CheckoutButton(
          textbutton: '108'.tr,
          onPressed: (){
            controller.checkout();
          },
        ),
      ),
      body: GetBuilder<CheckoutController>(builder: (controller)=>
          HandlingDataView(
              statusRequest: controller.statusRequest,
              widget: Container(
                padding: const EdgeInsets.all(10),
                child: ListView(
                  children:  [
                    const SizedBox(height: 20),
                     Center(
                      child:  Text("109".tr ,
                        style: const TextStyle(color: AppColor.primaryColor,
                          fontSize: 20,

                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    InkWell(
                      onTap: (){controller.choosePaymentMethod("0");
                      },
                      child: CardPaymentMethod(
                        title: '80'.tr,
                        isActive: controller.paymentMethod == "0" ? true : false,
                        icon: Icons.credit_card,
                      ),
                    ),
                    InkWell(
                      onTap: (){controller.choosePaymentMethod("1");},
                      child: CardPaymentMethod(
                        title: '81'.tr,
                        isActive: controller.paymentMethod == "1" ? true : false,
                        icon: Icons.paypal_outlined,
                      ),
                    ),
                    InkWell(
                      onTap: (){controller.choosePaymentMethod("2");},
                      child: CardPaymentMethod(
                        title: '82'.tr,
                        isActive: controller.paymentMethod == "2" ? true : false,
                        icon: Icons.handshake_outlined,
                      ),
                    ),
                    const SizedBox(height: 20),
                     Center(
                      child:  Text("110".tr ,
                        style: const TextStyle(color: AppColor.primaryColor,
                          fontSize: 20,

                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        DeliveryMethodCardCheckout(
                          textMethod: '78'.tr,
                          isActive: controller.deliveryType == "0" ? true : false,
                          onTapDeliveryMethod: (){
                            controller.chooseDeliveryType("0");
                          },
                          imageName: AppImageAsset.logo,
                        ),
                        DeliveryMethodCardCheckout(
                          textMethod: '79'.tr,
                          isActive: controller.deliveryType == "1" ? true : false,
                          onTapDeliveryMethod: (){
                            controller.chooseDeliveryType("1");
                          },
                          imageName: AppImageAsset.logo,
                        ),

                      ],
                    ),
                    const SizedBox(height: 20),
                 if(controller.deliveryType == "0")   Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       if(controller.dataaddress.isNotEmpty) Center(
                         child:  Text("111".tr ,
                           style: const TextStyle(color: AppColor.primaryColor,
                             fontSize: 20,

                           ),
                         ),
                       ),
                       const SizedBox(height: 20),
                      if(controller.dataaddress.isEmpty)
                        Center(
                          child: InkWell(
                            onTap: (){
                              Get.toNamed(AppRoute.addressAdd);
                            },
                            child: Container(
                              padding: EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: AppColor.primaryColor
                              ),
                              child: Text("Add Address", style: TextStyle(color: AppColor.white),),
                            ),
                          ),
                        ),
                      ...List.generate(
                             controller.dataaddress.length,
                            (index) =>  AddressChooseCheckout(
                        title: '${controller.dataaddress[index].addressName}',
                        subtitle: ' ${controller.dataaddress[index].addressCity} , ${controller.dataaddress[index].addressStreet}',
                        isActive: controller.addressId == controller.dataaddress[index].addressId ? true : false,
                        iconAddress: (Icons.location_on),
                        onTapAddressChoose: (){
                          controller.chooseShippingAddress(controller.dataaddress[index].addressId!);
                          print(controller.dataaddress[index].addressId);
                        },
                      ),
                      )
                     ],
                   )
                  ],
                ),
              )
          ),
      ),
    );
  }
}
