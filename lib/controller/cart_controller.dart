import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:glaregroup/core/constant/color.dart';
import 'package:glaregroup/core/constant/routes.dart';
import 'package:glaregroup/core/functions/handlingdatacontroller.dart';
import 'package:glaregroup/data/model/cartmodel.dart';
import 'package:glaregroup/data/model/couponmodel.dart';
import '../core/class/statusrequest.dart';
import '../core/services/services.dart';
import '../data/remote/cart_data.dart';

class  CartController extends GetxController{

  TextEditingController? controllercoupon;

  CartData cartData = CartData(Get.find());
  int? discountcoupon = 0 ;
  String? couponname ;
  String? couponaid ;
  late StatusRequest statusRequest;
  MyServices myServices = Get.find();
  CouponModel? couponModel;
  List<CartModel> data = [];
  double priceorders = 0;
  int totalcountitems = 0;




  add(String itemsid)async{
    update();
    statusRequest = StatusRequest.loading;
    var response = await cartData.addCart( myServices.sharedPreferences.getString("id")!, itemsid);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        // Get.rawSnackbar(
        //     duration: Duration(seconds: 1),
        //     barBlur: 10,
        //     backgroundColor: AppColor.primaryColor,
        //     margin: const EdgeInsets.all(20),
        //     borderRadius: 20,
        //     snackPosition: SnackPosition.TOP,
        //     icon: const Icon(Icons.done, color: AppColor.white,),
        //     title: "39".tr,
        //     messageText:Text(
        //       "57".tr,
        //       style: const TextStyle(
        //           color : AppColor.white,
        //           fontSize: 12),
        //     ));
        // data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure ;
      }
    }
    update();

  }

  delete(String itemsid)async{

    statusRequest = StatusRequest.loading;
    update();
    var response = await cartData.deleteCart( myServices.sharedPreferences.getString("id")!, itemsid);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        // Get.rawSnackbar(
        //     duration: Duration(seconds: 1),
        //     barBlur: 10,
        //     backgroundColor: AppColor.primaryColor,
        //     margin: const EdgeInsets.all(20),
        //     borderRadius: 20,
        //     snackPosition: SnackPosition.BOTTOM,
        //     icon: const Icon(Icons.done, color: AppColor.white,),
        //     title: "39".tr,
        //     messageText:Text(
        //       "57".tr,
        //       style: const TextStyle(
        //           color : AppColor.white,
        //           fontSize: 12),
        //     ));
        // data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure ;
      }
    }
    update();

  }

  getTotalPrice(){
   return (priceorders - priceorders * discountcoupon! / 100);
  }

  getCountItems(String itemsid)async{
    statusRequest = StatusRequest.loading;
    var response = await cartData.getCountCart( myServices.sharedPreferences.getString("id")!, itemsid);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        int countitems = 0 ;
        countitems = int.parse(response['data']);
        print("=============================");
        print("$countitems");
        return countitems;
      } else {
        statusRequest = StatusRequest.failure ;
      }
    }
    update();
  }


  resetVarCart(){
    totalcountitems = 0;
    priceorders = 0.0;
    data.clear();

  }

  refreshPage(){
    resetVarCart();
    view();
  }


  view()async{
    statusRequest = StatusRequest.loading;
    update();
    var response = await cartData.viewCart( myServices.sharedPreferences.getString("id")!);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        if (response['datacart']['status'] == 'success'){
          List dataresponse =  response['datacart']['data'];
          Map dataresponsecountprice = response['countprice'];
          data.clear();
          data.addAll(dataresponse.map((e) => CartModel.fromJson(e)));
          totalcountitems = int.parse(dataresponsecountprice['totalcount']);
          priceorders = double.parse(dataresponsecountprice['totalprice']);
        }
      } else {
        statusRequest = StatusRequest.failure ;
      }
    }
    update();
  }

  checkCoupon() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await cartData.checkCoupon(controllercoupon!.text);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Map<String, dynamic> datacoupon = response['data'];
        couponModel = CouponModel.fromJson(datacoupon);
        discountcoupon = int.parse(couponModel!.couponDiscount!);
        couponname = couponModel!.couponName;
        couponaid = couponModel!.couponId;

      } else {
       // statusRequest = StatusRequest.failure ;
        discountcoupon = 0;
        Get.rawSnackbar(
            duration: Duration(seconds: 1),
            barBlur: 10,
            backgroundColor: AppColor.red,
            margin: const EdgeInsets.all(20),
            borderRadius: 20,
            snackPosition: SnackPosition.TOP,
            icon: const Icon(Icons.not_interested, color: AppColor.white,),
            title: "39".tr,
            messageText:Text(
              "73".tr,
              style: const TextStyle(
                  color : AppColor.white,
                  fontSize: 12),
            ));
        couponname = null;
        couponaid = null;
      }
    }
    update();
  }

  goToPageCheckout(){
    if(data.isEmpty) return Get.snackbar("39".tr , "72".tr);
    Get.toNamed(AppRoute.checkout, arguments: {
      "couponid" : couponaid ?? "0",
      "discountcoupon" : discountcoupon.toString(),
      "priceorder" : priceorders.toString()
    });
  }

  @override
  void onInit() {
    controllercoupon = TextEditingController();
     view();
     super.onInit();
  }
}