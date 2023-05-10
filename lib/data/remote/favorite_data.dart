
import '../../core/class/crud.dart';
import '../../linkapi.dart';

class FavoriteData {
  Curd curd;

  FavoriteData(this.curd);

  addFavorite(String usersid , String itemsid) async {
    var response = await curd.postData(AppLink.addFavorite, {"userid" : usersid, "itemsid" : itemsid});
    return response.fold((l) => l, (r) => r);
  }
  deleteFavorite(String usersid , String itemsid) async {
    var response = await curd.postData(AppLink.deleteFavorite, {"userid" : usersid, "itemsid" : itemsid});
    return response.fold((l) => l, (r) => r);
  }
}