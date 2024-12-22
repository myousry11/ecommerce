import 'package:ecommerce/controller/onboarding_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/color.dart';

class CustomButtonOnBoarding extends GetView<OnBoardingControllerImp> {
  const CustomButtonOnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 210,
      height: 50,
      child: MaterialButton(
        color: AppColor.primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        onPressed: () {
          controller.next();
        },
        child: Text(
          "13".tr,
          textAlign: TextAlign.center,
          style:  TextStyle(
            color: AppColor.white,
            fontSize: 18,
            fontFamily: Get.locale?.languageCode == 'ar' ? 'Cairo' : 'ProductSans',
            fontWeight: FontWeight.w500,
            letterSpacing: Get.locale?.languageCode == 'ar' ? 0 : 1,
          ),
        ),
      ),
    );
  }
}
