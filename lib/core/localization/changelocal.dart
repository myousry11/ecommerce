import 'dart:ui';
import 'package:ecommerce/core/functions/fcm_config.dart';
import 'package:ecommerce/core/services/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart'; // تأكد من استيراد الحزمة

import '../../controller/home_controller.dart';
import '../constant/apptheme.dart';

class LocaleController extends GetxController {
  Locale? language;

  MyServices myServices = Get.find();

  ThemeData appTheme = themeEnglish;

  changeLang(String langCode) {
    Locale locale = Locale(langCode);
    myServices.sharedPreferences.setString("lang", langCode);
    appTheme = langCode == 'ar' ? themeArabic : themeEnglish;
    Get.changeTheme(appTheme);
    Get.updateLocale(locale);

    // تحديث لغة Jiffy بناءً على اللغة المختارة
    Jiffy.setLocale(langCode == 'ar' ? 'ar' : 'en');

    // تحديث HomeControllerImp بعد تغيير اللغة
    Get.find<HomeControllerImp>().lang = langCode;
    Get.find<HomeControllerImp>().update();

    Get.back();
  }

  requestPerLocation() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Get.snackbar("159".tr, "193".tr);
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Get.snackbar("159".tr, "194".tr);
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return Get.snackbar("159".tr, "195".tr);
    }
  }

  @override
  void onInit() async {
    requestPermissionNotification();
    await initializeLocalNotifications();
    fcmConfig();
    requestPerLocation();
    String? sharedPrefLang = myServices.sharedPreferences.getString("lang");
    if (sharedPrefLang == "ar") {
      language = const Locale("ar");
      appTheme = themeArabic;
      Jiffy.setLocale('ar'); // ضبط لغة Jiffy للعربية
    } else if (sharedPrefLang == "en") {
      language = const Locale("en");
      appTheme = themeEnglish;
      Jiffy.setLocale('en'); // ضبط لغة Jiffy للإنجليزية
    } else {
      language = Locale(Get.deviceLocale!.languageCode);
      appTheme = themeEnglish;
      Jiffy.setLocale(Get.deviceLocale!.languageCode == 'ar' ? 'ar' : 'en');
    }
    super.onInit();
  }
}
