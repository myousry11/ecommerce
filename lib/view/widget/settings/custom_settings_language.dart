
import 'package:ecommerce/core/localization/changelocal.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../getStarted/custombuttonlang.dart';
class CustomSettingsLanguage extends GetView<LocaleController> {
  const CustomSettingsLanguage({super.key});

  @override
  Widget build(BuildContext context) {
    return
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
        );
  }
}
