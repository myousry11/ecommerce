import 'package:ecommerce/controller/getstarted_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/color.dart';

class CustomButtonStarted extends GetView<WelcomeControllerImp> {
  const CustomButtonStarted({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 210,
      height: 50,
      child: MaterialButton(
        color: AppColor.primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: const BorderSide(color: AppColor.white, width: 2),
        ),
        onPressed: () {
          controller.goToOnBoarding();
        },
        child:  Text(
          '4'.tr,
          style:  Theme.of(context).textTheme.displayMedium!.copyWith(color: AppColor.white),
        ),
      ),
    );
  }
}
