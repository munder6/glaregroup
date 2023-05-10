
import '../../core/class/crud.dart';
import '../../linkapi.dart';

class CheckoutData {
  Curd curd;

  CheckoutData(this.curd);

  checkout(Map data) async {
    var response = await curd.postData(AppLink.checkout, data);
    return response.fold((l) => l, (r) => r);
  }
}