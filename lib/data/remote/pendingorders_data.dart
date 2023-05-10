
import '../../core/class/crud.dart';
import '../../linkapi.dart';

class OrderPendingData {
  Curd curd;

  OrderPendingData(this.curd);

  getData(String userid) async {
    var response = await curd.postData(AppLink.orderPending, {
      "id" : userid,
    });
    return response.fold((l) => l, (r) => r);
  }

  deleteData(String orderid) async {
    var response = await curd.postData(AppLink.ordersDelete, {
      "id" : orderid,
    });
    return response.fold((l) => l, (r) => r);
  }
}