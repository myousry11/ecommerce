// bindings.dart
import 'package:ecommerce/controller/address/add_conreoller.dart';
import 'package:ecommerce/controller/address/add_details_controller.dart';
import 'package:ecommerce/controller/address/view_controller.dart';
import 'package:ecommerce/controller/auth/verify_signup_controller.dart';
import 'package:ecommerce/controller/cart_controller.dart';
import 'package:ecommerce/controller/forgetpassword/forget_password_controller.dart';
import 'package:ecommerce/controller/forgetpassword/reset_password_controller.dart';
import 'package:ecommerce/controller/auth/signup_controller.dart';
import 'package:ecommerce/controller/forgetpassword/verify_password_controller.dart';
import 'package:ecommerce/controller/home_controller.dart';
import 'package:ecommerce/controller/items_controller.dart';
import 'package:ecommerce/controller/onboarding_controller.dart';
import 'package:ecommerce/controller/productdetails_controller.dart';
import 'package:ecommerce/controller/profile_controller.dart';
import 'package:ecommerce/controller/searchcontroller.dart';
import 'package:ecommerce/core/class/crud.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/core/localization/changelocal.dart';
import 'package:ecommerce/controller/getstarted_controller.dart';

import '../../controller/auth/login_controller.dart';
import '../controller/auth/test_controller.dart';
import '../controller/home_screen_controller.dart'; // تأكد من تعديل المسار إذا لزم الأمر.

class AppBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(WelcomeControllerImp());
    Get.put(OnBoardingControllerImp());
    Get.lazyPut(() => LoginControllerImp(), fenix: true);
    Get.lazyPut(() => SignUpControllerImp(), fenix: true);
    Get.lazyPut(() => ForgetPasswordControllerImp(), fenix: true);
    Get.lazyPut(() => VerifyPasswordControllerImp(), fenix: true);
    Get.lazyPut(() => ResetPasswordControllerImp(), fenix: true);
    Get.lazyPut(() => VerifySignupControllerImp(), fenix: true);
    Get.put(Crud());
    // Get.put(TestController());
    Get.put(HomeControllerImp(), permanent: true);
    Get.lazyPut(() => HomeScreenControllerImp(), fenix: true);
    Get.lazyPut(() => ItemsControllerImp());
    Get.lazyPut(() => ProductDetailsControllerImp(), fenix: true);
    Get.lazyPut(() => CartController(), fenix: true);
    Get.lazyPut(() => SearchControllerImp(), fenix: true);
    Get.lazyPut(() => ProfileControllerImp(), fenix: true);
    Get.lazyPut(() => AddAddressController(), fenix: true);
    Get.lazyPut(() => AddAddressDetailsController(), fenix: true);
    Get.lazyPut(() => AddressViewController(), fenix: true);


  }
}

