import 'package:ecommerce/core/constant/routes.dart';
import 'package:ecommerce/data/datasource/remote/auth/verifycode.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'dart:async';

import '../../core/class/statusrequest.dart';
import '../../core/functions/bottomsheet.dart';
import '../../core/functions/handlingdata_controller.dart';

abstract class VerifySignupController extends GetxController {
  checkCode(String code);
  goToLogin();
   startResendTimer();
   resendCode();

}

class VerifySignupControllerImp extends VerifySignupController {
  RxBool isButtonActive = false.obs;
  RxBool isResendActive = false.obs;
  RxInt remainingTime = 10.obs;

  Timer? _timer;
  String? email;
  VerifyCodeSignUpData verifyCodeSignUpData = VerifyCodeSignUpData(Get.find());
  StatusRequest? statusRequest;

  String verifyCodeSignUp = ''; // استخدام نفس المتغير هنا

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
   startResendTimer() {
    _timer?.cancel();
    remainingTime.value = 10;
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
   checkCode(String code) {
    verifyCodeSignUp = code; // تعيين القيمة هنا مباشرة
    isButtonActive.value = verifyCodeSignUp.length == 5;
  }

  @override
   resendCode() {
    if (isResendActive.value) {
      startResendTimer();
    }
  }

  @override
   goToLogin() async { // حذف المعامل هنا
    if (isButtonActive.value) {
      statusRequest = StatusRequest.loading;
      update();

      var response = await verifyCodeSignUpData.postData(
        email!,
        verifyCodeSignUp, // استخدم verifyCodeSignUp مباشرة هنا
      );

      print("=============================== Controller $response ");
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          showCustomBottomSheet(
            context: Get.context!,
            onPressed: () {
              Get.offNamed(AppRoute.login);
            },
            imageAsset: 'assets/icons/success.gif',
            title: '42'.tr,
            textBody: '41'.tr,
            textButton: '21'.tr,
          );
        } else {
          Get.defaultDialog(
            title: "Warning",
            middleText: "Verify Code not correct"
          );
          statusRequest = StatusRequest.failure;
        }
      } else {
        debugPrint("Error Status: $response");
        statusRequest = response as StatusRequest;
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
