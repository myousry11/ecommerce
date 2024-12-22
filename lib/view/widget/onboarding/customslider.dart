import 'package:ecommerce/controller/onboarding_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/color.dart';
import '../../../data/datasource/static/static.dart';

class CustomSliderOnBoarding extends GetView<OnBoardingControllerImp> {
  const CustomSliderOnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      onPageChanged: (val){
        controller.onPageChanged(val);
      },
      controller: controller.pageController,
      itemCount: onBoardingList.length,
      itemBuilder: (context, i) => Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 20, right: 15),
            child: Text(
              onBoardingList[i].title!,
              style: Theme.of(context).textTheme.headlineLarge,
              textAlign: TextAlign.center,
            ),
          ),
           const SizedBox(height: 30),
          AnimatedBuilder(
            animation: controller.pageController,
            builder: (context, child) {
              double value = 1.0;
              if (controller.pageController.position.haveDimensions) {
                value = controller.pageController.page! - i;
                value = (1 - (value.abs() * 0.3)).clamp(0.0, 1.0);
              }
              return Center(
                child: SizedBox(
                  height: Curves.easeOut.transform(value) * 400,
                  width: Curves.easeOut.transform(value) * 360,
                  child: child,
                ),
              );
            },
            child: Card(
              color: AppColor.grey,
              clipBehavior: Clip.antiAlias,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Image.asset(
                onBoardingList[i].image!,
                fit: BoxFit.contain,
              ),
            ),
          ),
          const SizedBox(height: 20),
          Container(
            width: double.infinity,
            alignment: Alignment.center,
            child: Text(
              onBoardingList[i].body!,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ),
        ],
      ),
    );
  }
}
