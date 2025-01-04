import 'package:ecommerce/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'custom_images_ads.dart';
class CustomCardAds extends StatelessWidget {
  const CustomCardAds({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeControllerImp>(builder: (controller)=> Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Container(
            width: double.infinity,
            height: 220,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Stack(
              children: [
                // PageView for image slides
                PageView(
                  controller: controller.pageController,
                  physics: const BouncingScrollPhysics(),
                  onPageChanged: controller.onPageChanged,
                  children: [
                    CustomAdsImage(
                      imagePath: 'assets/images/home/ads1.png',
                      title: '${"51".tr}      \n${"54".tr} \n2024    ',
                    ),
                    CustomAdsImage(
                      imagePath: 'assets/images/home/ad2.jpg',
                      title: '${"52".tr}      \n${"54".tr} \n2024    ',
                    ),
                    CustomAdsImage(
                      imagePath: 'assets/images/home/ads3.jpg',
                      title: '${"53".tr}      \n${"54".tr} \n2024    ',
                    ),
                  ],
                ),
                // Page indicator
                Positioned(
                  bottom: 10,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: SmoothPageIndicator(
                      controller: controller.pageController,
                      count: 3,
                      effect: const ExpandingDotsEffect(
                        dotHeight: 8,
                        dotWidth: 8,
                        activeDotColor: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    ));
  }
}
