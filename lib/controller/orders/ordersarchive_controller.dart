import 'package:get/get.dart';
import 'package:glaregroup/core/class/statusrequest.dart';
import 'package:glaregroup/core/constant/routes.dart';
import 'package:glaregroup/core/functions/handlingdatacontroller.dart';
import 'package:glaregroup/core/services/services.dart';
import 'package:glaregroup/data/model/ordersmodel.dart';
import 'package:glaregroup/data/remote/ordersarchive_data.dart';

class OrdersArchiveController extends GetxController {

  List<OrdersModel> data = [];
  late StatusRequest statusRequest;
  MyServices myServices = Get.find();
  OrderArchiveData orderArchiveData = OrderArchiveData(Get.find());


  String printOrderType(String val) {
    if (val == "0") {
      return "78".tr;
    } else {
      return "79".tr;
    }
  }

  String printPaymentMethod(String val) {
    if (val == "0") {
      return "80".tr;
    }
    if (val == "1") {
      return "81".tr;
    } else {
      return "82".tr;
    }
  }

  String printOrderStatus(String val) {
    if (val == "0") {
      return "83".tr;
    } else if (val == "1") {
      return "84".tr;
    } else if (val == "2") {
      return "85".tr;
    } else if (val == "3") {
      return "84".tr;
    }else {
      return "86".tr;
    }
  }

  getOrder() async {
    data.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await orderArchiveData.getData(
        myServices.sharedPreferences.getString("id")!);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List listdata = response['data'];
        data.addAll(listdata.map((e) => OrdersModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  submitRating( String ordersid,double rating ,String comment)async{
    data.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await orderArchiveData.rating(ordersid , comment , rating.toString());
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        print("Success");
        getOrder();
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }


  refreshOrder(){
    getOrder();
  }

  @override
  void onInit() {
    getOrder();
    super.onInit();
  }
}