import '../../../../core/class/crud.dart';
import '../../../../linkapi.dart';

class VerifyCodeSignUpData {
  Crud crud;
  VerifyCodeSignUpData(this.crud);

  postData(String email, String verifyCode) async {
    var response = await crud.postData(AppLink.verifyCode, {
      "email" : email,
      "verifycode" : verifyCode,
    });
    return response.fold((l) => l, (r) => r);

  }
}