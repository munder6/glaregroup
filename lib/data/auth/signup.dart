
import '../../core/class/crud.dart';
import '../../linkapi.dart';

class SignUpData {
  Curd curd;

  SignUpData(this.curd);

  postdata(String username, String password, String email, String phone) async {
    var response = await curd.postData(AppLink.signUp, {
      "username" : username ,
      "password" : password,
      "email" : email,
      "phone" : phone,
    });
    return response.fold((l) => l, (r) => r);
  }
}