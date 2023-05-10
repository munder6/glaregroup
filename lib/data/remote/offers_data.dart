
import '../../core/class/crud.dart';
import '../../linkapi.dart';

class OffersData {
  Curd curd;

  OffersData(this.curd);

  getData() async {
    var response = await curd.postData(AppLink.offers, {});
    return response.fold((l) => l, (r) => r);
  }
}