
import '../../core/class/crud.dart';
import '../../linkapi.dart';

class NotificationData {
  Curd curd;

  NotificationData(this.curd);

  getData(String id) async {
    var response = await curd.postData(AppLink.notification, {"id" : id});
    return response.fold((l) => l, (r) => r);
  }
}