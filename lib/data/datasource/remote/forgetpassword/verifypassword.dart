

import '../../../../core/class/crud.dart';
import '../../../../linkapi.dart';

class VerifyCodePasswordData {
  Crud crud;
  VerifyCodePasswordData(this.crud);
  postData(String email ,String verifyCode) async {
    var response = await crud.postData(AppLink.verifyPass, {
      "email" : email ,
      "verifycode" : verifyCode,
    });
    return response.fold((l) => l, (r) => r);
  }

  resendData(String email) async{
    var response = await crud.postData(AppLink.resendCode, {
      "email" : email ,
    });
    return response.fold((l) => l, (r) => r);
  }

}