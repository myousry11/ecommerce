import 'dart:ui';
import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/core/constant/imageassets.dart';
import 'package:ecommerce/core/localization/changelocal.dart';
import 'package:ecommerce/view/widget/getStarted/custombuttomstarted.dart';
import 'package:ecommerce/view/widget/getStarted/custombuttonlang.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WelcomeScreen extends GetView<LocaleController> {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          AppImageAsset.getStarted,
          fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,
        ),
        BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
          child: Container(
            color: Colors.black.withOpacity(0),
          ),
        ),
        Positioned(
          top: 45,
          right: 15,
          child: GestureDetector(
            onTap: () {
              Get.dialog(
                AlertDialog(
                  backgroundColor: Colors.white,
                  title: Text('1'.tr, style: Theme.of(context).textTheme.headlineLarge),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CustomButtonLang(
                        title: 'English',
                        image: 'assets/icons/english.png',
                        onTap: () {
                          controller.changeLang("en");
                        },
                      ),
                      CustomButtonLang(
                        title: 'Arabic',
                        image: 'assets/icons/arabic.png',
                        onTap: () {
                          controller.changeLang("ar");
                        },
                      ),
                    ],
                  ),
                ),
                transitionDuration: const Duration(milliseconds: 10),
              );
            },
            child: const Image(
              image: AssetImage('assets/icons/language.gif'),
              width: 70,
              height: 70,
            ),
          ),
        ),
         Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 30),
              Directionality(
                textDirection: Get.locale?.languageCode == 'ar' ? TextDirection.rtl : TextDirection.ltr,
                child: Text(
                  '2'.tr,
                  style:  Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: AppColor.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 30),
              Text(
                '3'.tr,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: AppColor.white
                ),
              ),
            ],
          ),
        ),
        // زر Get Started
        const Positioned(
          bottom: 60,
          left: 0,
          right: 0,
          child: Center(
            child: CustomButtonStarted(),
          ),
        ),
      ],
    );
  }
}
