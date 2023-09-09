
import '../../core/class/crud.dart';
import '../../linkapi.dart';

class ItemsData {
  Curd curd;

  ItemsData(this.curd);

  getData(String id , String userid) async {
    var response = await curd.postData(AppLink.items, {"id" : id.toString(), "userid" : userid.toString()});
    return response.fold((l) => l, (r) => r);
  }
}