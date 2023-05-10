
import '../../core/class/crud.dart';
import '../../linkapi.dart';

class AddressData {
  Curd curd;

  AddressData(this.curd);

  getData(String userid) async {
    var response = await curd.postData(AppLink.addressView, {
      "userid" : userid ,
    });
    return response.fold((l) => l, (r) => r);
  }
  addData(String userid,String name,String city,String street,String lat,String long) async {
    var response = await curd.postData(AppLink.addressAdd, {
      "userid" : userid ,
      "name" : name,
      "city" : city,
      "street" : street,
      "lat" : lat,
      "long" : long,
    });
    return response.fold((l) => l, (r) => r);
  }
  deleteData(String addressid) async {
    var response = await curd.postData(AppLink.addressDelete, {
      "addressid" : addressid
    });
    return response.fold((l) => l, (r) => r);
  }
}