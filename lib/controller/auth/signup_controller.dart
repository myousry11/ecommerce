import 'dart:convert';
import 'package:ecommerce/core/constant/routes.dart';
import 'package:ecommerce/data/datasource/remote/auth/signup.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/class/statusrequest.dart';
import '../../core/functions/bottomsheet.dart';
import '../../core/functions/handlingdata_controller.dart';
import '../../view/widget/auth/custom_success_bottomsheet.dart';

abstract class SignUpController extends GetxController {
  signUp(BuildContext context); // Pass BuildContext
  goToLogIn();
  togglePasswordVisibility();
  toggleRePasswordVisibility();
}

class SignUpControllerImp extends SignUpController {
  late GlobalKey<FormState> formState4;

  late TextEditingController name;
  late TextEditingController email;
  late TextEditingController phone;
  late TextEditingController password;
  late TextEditingController confirmPassword;

  var isPasswordVisible = false.obs;
  var isRePasswordVisible = false.obs;

  StatusRequest statusRequest = StatusRequest.none;
  SignupData signupData = SignupData(Get.find());
  List data = [];

  @override
  signUp(BuildContext context) async {
    var formData = formState4.currentState;
    if (formData!.validate()) {
      statusRequest = StatusRequest.loading;
      update();

      var response = await signupData.postData(
        name.text,
        email.text,
        phone.text,
        password.text,
        confirmPassword.text,
      );

      print("=============================== Controller $response ");
      statusRequest = handlingData(response);

      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          //data.addAll(response['data']);
          // Get.offNamed(AppRoute.verifySignup, arguments: {
          //  "email" : email.text,
          // });
          showCustomBottomSheet(
            context: Get.context!,
            onPressed: () {
              Get.offAllNamed(AppRoute.login);
            },
            imageAsset: 'assets/icons/success.gif',
            title: '42'.tr,
            textBody: '41'.tr,
            textButton: '21'.tr,
          );

        } else {
          showCustomBottomSheet(
            context: context,
            onPressed: () {
              Get.back();
            },
            lottieAsset: 'assets/lottie/wrong.json',
            title: '48'.tr,
            textBody: '49'.tr,
            textButton: '50'.tr,
          );
          statusRequest = StatusRequest.failure;
        }
      } else {
        // Handle errors from StatusRequest
        print("Error Status: $response");
        statusRequest = response as StatusRequest;
        // Display an error message if needed
      }

      update();
    } else {
      print("Form not valid");
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
  goToLogIn() {
    Get.offAllNamed(AppRoute.login);
  }

  @override
  void onInit() {
    formState4 = GlobalKey<FormState>();
    email = TextEditingController();
    name = TextEditingController();
    phone = TextEditingController();
    password = TextEditingController();
    confirmPassword = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    name.dispose();
    email.dispose();
    phone.dispose();
    password.dispose();
    confirmPassword.dispose();
    super.dispose();
  }
}
