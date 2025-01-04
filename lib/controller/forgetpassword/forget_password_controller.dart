import 'package:ecommerce/core/class/statusrequest.dart';
import 'package:ecommerce/core/constant/routes.dart';
import 'package:ecommerce/core/functions/handlingdata_controller.dart';
import 'package:ecommerce/data/datasource/remote/forgetpassword/checkemail.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

abstract class ForgetPasswordController extends GetxController {
  checkEmail();
}

class ForgetPasswordControllerImp extends ForgetPasswordController {
  late GlobalKey<FormState> formState2;

  late TextEditingController email;
  CheckEmailData checkEmailData = CheckEmailData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;



  @override
  checkEmail() async{
    if(formState2.currentState!.validate()){
      statusRequest = StatusRequest.loading;
      update();
      var response = await checkEmailData.postData(email.text);
      print("=============================== Controller $response ");
      statusRequest = handlingData(response);
      if(StatusRequest.success == statusRequest){
        if(response['status'] == "success"){
          Get.offNamed(AppRoute.verifyPassword, arguments: {
            "email" : email.text,
          });
        }
        else{
          Get.defaultDialog(
              title: "159".tr,
              middleText: "185".tr
          );
        }
      }
      update();
    }
  }

  @override
  void onInit() {
    formState2 = GlobalKey<FormState>();
    email = TextEditingController();

    super.onInit();
  }
  @override
  void onClose() {
    email.clear();
    super.onClose();
  }
}