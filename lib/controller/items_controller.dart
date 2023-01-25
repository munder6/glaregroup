import 'package:get/get.dart';
import 'package:glaregroup/core/services/services.dart';

import '../core/class/statusrequest.dart';
import '../core/functions/handlingdatacontroller.dart';
import '../data/model/itemsmodel.dart';
import '../data/remote/itemsdata.dart';



abstract class ItemsController extends GetxController {
 intialData();
 changeCat(int val, String catval);
 getItems(String categoryid);
 goToPageProductDetails(ItemsModel itemsModel);
}

class ItemsControllerImp extends ItemsController {

  List categories = [] ;
  String? catid ;
  int? selectedCat ;

  ItemsData testData = ItemsData(Get.find());

  List data = [];

  late StatusRequest statusRequest;
  MyServices myServices = Get.find();



  @override
  void onInit() {
    intialData();
    super.onInit();
  }

  @override
  intialData() {
    categories = Get.arguments['categories'];
    selectedCat = Get.arguments['selectedCat'];
    catid = Get.arguments['catid'];
    getItems(catid!);
  }

  @override
  changeCat(val, catval) {
   selectedCat =val;
   catid = catval;
   getItems(catid!);
   update();
  }

  @override
  getItems(categoryid) async {
    data.clear();
    statusRequest = StatusRequest.loading;
    var response = await testData.getData(categoryid, myServices.sharedPreferences.getString("id")!);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure ;
      }
    }
    update();
  }

  @override
  goToPageProductDetails(itemsModel){
    Get.toNamed("productdetails", arguments: {
      "itemsmodel" : itemsModel
    });
  }


}