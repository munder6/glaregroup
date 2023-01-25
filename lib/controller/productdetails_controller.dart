import 'package:get/get.dart';

import '../data/model/itemsmodel.dart';

abstract class ProductDetailsController extends GetxController {

}

class ProductDetailsControllerImp extends ProductDetailsController {

  late ItemsModel itemsModel;

  initialData(){
   itemsModel = Get.arguments['itemsmodel'];
  }

  List subitems = [
    {"name" : "Red", "id" : 1, "active" : "1",},
    {"name" : "Green", "id" : 2, "active" : "1",},
    {"name" : "Yellow", "id" : 3, "active" : "1",},
    {"name" : "Black", "id" : 4, "active" : "1",}
  ];


  @override
  void onInit() {
    initialData();
    super.onInit();
  }

}