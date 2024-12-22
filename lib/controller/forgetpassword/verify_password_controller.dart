import 'package:ecommerce/core/constant/routes.dart';
import 'package:ecommerce/data/datasource/remote/auth/verifycode.dart';
import 'package:ecommerce/data/datasource/remote/forgetpassword/verifypassword.dart';
import 'package:get/get.dart';
import 'dart:async';

import '../../core/class/statusrequest.dart';
import '../../core/functions/handlingdata_controller.dart';

abstract class VerifyPasswordController extends GetxController {
  void checkCode(String code);
  void goToReset();
  void startResendTimer();
  void resendCode();

}

class VerifyPasswordControllerImp extends VerifyPasswordController {
  RxBool isButtonActive = false.obs;
  RxBool isResendActive = false.obs;
  RxInt remainingTime = 10.obs;
  late String verifyCode;
  Timer? _timer;

  String? email;
  VerifyCodePasswordData verifyCodePasswordData = VerifyCodePasswordData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;



  @override
  void onReady() {
    super.onReady();
    resetState();
  }

  void resetState() {
    isButtonActive.value = false;
    isResendActive.value = false;
    startResendTimer();
  }

  @override
  void startResendTimer() {
    _timer?.cancel();
    remainingTime.value = 30;
    isResendActive.value = false;

    Future.delayed(Duration.zero, () {
      _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        if (remainingTime.value > 0) {
          remainingTime.value--;
        } else {
          isResendActive.value = true;
          _timer?.cancel();
        }
      });
    });
  }


  @override
  void checkCode(code) {
    verifyCode = code;
    isButtonActive.value = verifyCode.length == 5;
  }

  @override
  void resendCode() async{
    if (isResendActive.value) {
      startResendTimer();
      var response = await verifyCodePasswordData.resendData(email!);
      statusRequest = handlingData(response);

      if (StatusRequest.success == statusRequest) {
        if (response['status'] == 'success') {
          Get.snackbar("Success", "Code resent successfully");
        } else {
          Get.snackbar("Error", response['message']);
        }
      }

      startResendTimer();
      update();
    }
  }

  @override
  void goToReset() async {
    if (isButtonActive.value) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await verifyCodePasswordData.postData(email!, verifyCode);
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest){
        if (response['status'] == 'success'){
          Get.offNamed(AppRoute.resetPassword, arguments: {
            'email' : email
          });
        }else{
          Get.defaultDialog(
              title: "Warning!",
              middleText: "Verify code not correct"
          );
          statusRequest = StatusRequest.failure;
        }
      }
      update();

    }
  }

  @override
  void onInit() {
    email = Get.arguments['email'];
    super.onInit();
  }
  @override
  void onClose() {
    _timer?.cancel();
    super.onClose();
  }
}