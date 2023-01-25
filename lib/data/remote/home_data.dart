
import '../../core/class/crud.dart';
import '../../linkapi.dart';

class HomeData {
  Curd curd;

  HomeData(this.curd);

  getData() async {
    var response = await curd.postData(AppLink.homepage, {});
    return response.fold((l) => l, (r) => r);
  }
}