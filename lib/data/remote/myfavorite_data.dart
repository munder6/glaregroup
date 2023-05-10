
import '../../core/class/crud.dart';
import '../../linkapi.dart';

class MyFavoriteData {
  Curd curd;

  MyFavoriteData(this.curd);

  getData(String id) async {
    var response = await curd.postData(AppLink.favoriteView, {"id" : id});
    return response.fold((l) => l, (r) => r);
  }

  deleteData(String id) async {
    var response = await curd.postData(AppLink.deleteFromFavorite, {"id" : id});
    return response.fold((l) => l, (r) => r);
  }
}