import '../../../../core/class/crud.dart';
import '../../../../core/class/statusrequest.dart';
import '../../../../linkapi.dart';

class SignupData {
  Crud crud;
  SignupData(this.crud);

  postData(String username, String email, String phone, String password, String rePassword) async {
    var response = await crud.postData(AppLink.signup, {
      "name" : username,
      "email" : email,
      "phone" : phone,
      "password" : password,
      "repassword" : rePassword,
    });
    return response.fold((l) => l, (r) => r);

  }
}