import 'package:ecommerce/controller/onboarding_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/color.dart';
import '../../../data/datasource/static/static.dart';

class CustomDotControllerOnBoarding extends StatelessWidget {
  const CustomDotControllerOnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnBoardingControllerImp>(
        builder: (controller) => Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            onBoardingList.length,
                (index) => AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              margin: const EdgeInsets.symmetric(horizontal: 4),
              width: controller.currentPage == index ? 20 : 8,
              height: 8,
              decoration: BoxDecoration(
                color: controller.currentPage == index
                    ? AppColor.black
                    : Colors.grey,
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          ),
        )
    );
  }
}
