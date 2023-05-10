
import '../../core/class/crud.dart';
import '../../linkapi.dart';

class OrdersDetailsData {
  Curd curd;

  OrdersDetailsData(this.curd);

  getData(String id) async {
    var response = await curd.postData(AppLink.ordersDetails, {
      "id" : id
    });
    return response.fold((l) => l, (r) => r);
  }
}