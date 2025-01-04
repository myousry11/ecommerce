import 'package:ecommerce/core/class/statusrequest.dart';
import 'package:ecommerce/core/constant/routes.dart';
import 'package:ecommerce/core/services/services.dart';
import 'package:ecommerce/data/datasource/remote/auth/login.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../core/functions/handlingdata_controller.dart';

abstract class LoginController extends GetxController {
  login();
  goToSignUp();
  onAppleLogin();
  onGoogleLogin();
  onFacebookLogin();
  goToForgetPassword();
  togglePasswordVisibility();
}

class LoginControllerImp extends LoginController {
  late GlobalKey<FormState> formState3;
  late TextEditingController email;
  late TextEditingController password;
  var isPasswordVisible = false.obs;

  StatusRequest statusRequest = StatusRequest.none;
  LoginData loginData = LoginData(Get.find());

  MyServices myServices = Get.find();

  @override
  void onInit() {
    FirebaseMessaging.instance.getToken().then((value){
      print(value);
      String? token = value;
    });
    formState3 = GlobalKey<FormState>();
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  login() async {
    var formData = formState3.currentState;
    if (formData!.validate()) {
      statusRequest = StatusRequest.loading;
      update();

      var response = await loginData.postData(
        email.text,
        password.text,
      );

      statusRequest = handlingData(response);

      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          //data.addAll(response['data']);

          if(response['data']['users_approve'] == 1){
            myServices.sharedPreferences.setString("id", response['data']['users_id'].toString());
            String userId = myServices.sharedPreferences.getString("id")!;
            myServices.sharedPreferences.setString("name", response['data']['users_name']);
            myServices.sharedPreferences.setString("email", response['data']['users_email']);
            myServices.sharedPreferences.setString("phone", response['data']['users_phone']);
            myServices.sharedPreferences.setString("step", "2");
            FirebaseMessaging.instance.subscribeToTopic("users");
            FirebaseMessaging.instance.subscribeToTopic("users${userId}");
            Get.offNamed(AppRoute.home);
          }else{
            Get.toNamed(AppRoute.verifySignup, arguments: {
              "email" : email.text,
            });
          }
        } else {
          Get.defaultDialog(
              title: "Warning",
              middleText: "Email or password not correct");
          statusRequest = StatusRequest.failure;
        }
      } else {
        // Handle errors from StatusRequest
        print("Error Status: $response");
        statusRequest = response as StatusRequest;
        // Display an error message if needed
      }

      update();
    }
  }

  @override
  togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  @override
  goToSignUp() {
    Get.offAllNamed(AppRoute.signUp);
  }

  @override
  goToForgetPassword() {
    Get.toNamed(AppRoute.forgetPassword);
  }

  @override
  onAppleLogin() {
    // TODO: implement onAppleLogin
  }

  @override
  onFacebookLogin() {
    // TODO: implement onFacebookLogin
  }

  @override
  onGoogleLogin() {
    // TODO: implement onGoogleLogin
  }
}
