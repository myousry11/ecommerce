import 'package:ecommerce/controller/onboarding_controller.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/view/widget/onboarding/custombutton.dart';
import 'package:ecommerce/view/widget/onboarding/customslider.dart';
import 'package:ecommerce/view/widget/onboarding/dotcontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../bindings/initial_bindings.dart';


class OnBoardingScreen extends GetView<AppBindings> {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    OnBoardingControllerImp controller = Get.find();
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const Expanded(
              flex: 4,
              child: CustomSliderOnBoarding(),
            ),
            Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 20),
                    child: const CustomDotControllerOnBoarding(),
                  ),
                  const SizedBox(height: 15),
                  const CustomButtonOnBoarding(),
                  TextButton(
                    style: TextButton.styleFrom(
                      overlayColor: AppColor.grey,
                    ),
                    onPressed: () {
                      controller.skip();
                    },
                    child:  Text(
                      "14".tr,
                      style:  Theme.of(context).textTheme.bodySmall,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
