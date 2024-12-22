
import 'package:ecommerce/core/class/statusrequest.dart';
import 'package:ecommerce/core/functions/handlingdata_controller.dart';
import 'package:ecommerce/data/datasource/remote/forgetpassword/resetpassword.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/functions/bottomsheet.dart';
import '../../view/widget/auth/custom_success_bottomsheet.dart';

abstract class ResetPasswordController extends GetxController {
  onButtonSuccessReset(BuildContext context);
  togglePasswordVisibility();
  toggleRePasswordVisibility();
}

class ResetPasswordControllerImp extends ResetPasswordController {
  late GlobalKey<FormState> formState1;

  var isPasswordVisible = false.obs;
  var isRePasswordVisible = false.obs;

  late TextEditingController password;
  late TextEditingController rePassword;
  
  ResetPasswordData resetPasswordData = ResetPasswordData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;
  String? email;


  @override
  onButtonSuccessReset(BuildContext context) async{


    var formData = formState1.currentState;
    if (formData!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await resetPasswordData.postData(email!, password.text);
      print("=============================== Controller $response ");
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest){
        if (response['status'] == 'success'){
          showCustomBottomSheet(
            context: context,
            onPressed: () {
              Get.back();
              Get.back();
            },
            imageAsset: 'assets/icons/success.gif',
            title: '40'.tr,
            textBody: '41'.tr,
            textButton: '21'.tr,
          );
        }
        else {
          Get.defaultDialog(
            title: "Warning",
            middleText: "Try Again",
          );
          statusRequest = StatusRequest.failure;
        }
      }
    }
  }

  @override
   togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }
  @override
   toggleRePasswordVisibility() {
    isRePasswordVisible.value = !isRePasswordVisible.value;
  }

  @override
  void onInit() {
    email = Get.arguments['email'];
    formState1 = GlobalKey<FormState>();
    password = TextEditingController();
    rePassword = TextEditingController();

    super.onInit();
  }
  @override
  void dispose() {
    password.dispose();
    rePassword.dispose();
    super.dispose();
  }
}