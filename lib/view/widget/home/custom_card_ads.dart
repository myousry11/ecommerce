import 'package:ecommerce/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'custom_images_ads.dart';
class CustomCardAds extends GetView<HomeControllerImp> {
  const CustomCardAds({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
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
                  children: const [
                    CustomAdsImage(
                      imagePath: 'assets/images/home/ads1.png',
                      title: 'Autumn      \nCollection \n2012    ',
                    ),
                    CustomAdsImage(
                      imagePath: 'assets/images/home/ad2.jpg',
                      title: 'Summer      \nCollection \n2012    ',
                    ),
                    CustomAdsImage(
                      imagePath: 'assets/images/home/ads3.jpg',
                      title: 'Winter      \nCollection \n2012    ',
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
    );
  }
}
