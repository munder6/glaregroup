
import '../../core/class/crud.dart';
import '../../linkapi.dart';

class CartData {

  Curd curd;

  CartData(this.curd);

  addCart(String usersid , String itemsid) async {
    var response = await curd.postData(AppLink.addCart, {"userid" : usersid, "itemsid" : itemsid});
    return response.fold((l) => l, (r) => r);
  }
  deleteCart(String usersid , String itemsid) async {
    var response = await curd.postData(AppLink.deleteCart, {"userid" : usersid, "itemsid" : itemsid});
    return response.fold((l) => l, (r) => r);
  }
  getCountCart(String usersid , String itemsid) async {
    var response = await curd.postData(AppLink.cartGetCountItems, {"userid" : usersid, "itemsid" : itemsid});
    return response.fold((l) => l, (r) => r);
  }

  viewCart(String usersid) async {
    var response = await curd.postData(AppLink.cartView, {"userid" : usersid});
    return response.fold((l) => l, (r) => r);
  }

  checkCoupon(String couponName) async {
    var response = await curd.postData(AppLink.checkCoupon, {"couponName" : couponName});
    return response.fold((l) => l, (r) => r);
  }
}