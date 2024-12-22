import 'dart:ui';

import 'package:ecommerce/core/services/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

import '../constant/apptheme.dart';

class LocaleController extends GetxController {
  Locale? language;

  MyServices myServices = Get.find();

  ThemeData appTheme = themeEnglish;

  changeLang(String langCode){
    Locale locale = Locale(langCode);
    myServices.sharedPreferences.setString("lang", langCode);
    appTheme = langCode == 'ar' ? themeArabic : themeEnglish;
    Get.changeTheme(appTheme);
    Get.updateLocale(locale);
    Get.back();
  }
  requestPerLocation() async{
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if(!serviceEnabled){
      return Get.snackbar("Warning", "Please enable Location Service");
    }
    permission = await Geolocator.checkPermission();
    if(permission == LocationPermission.denied){
      permission = await Geolocator.requestPermission();
      if(permission == LocationPermission.denied){
        return Get.snackbar("Warning", "Please Give Permission Location Service");

      }
    }
    if(permission == LocationPermission.deniedForever){
      return Get.snackbar("Warning", "Can`t use application without Location");
    }
  }

  @override
  void onInit(){
    requestPerLocation();
    String? sharedPrefLang = myServices.sharedPreferences.getString("lang");
    if (sharedPrefLang == "ar"){
      language = const Locale("ar");
      appTheme = themeArabic;
    }
    else if (sharedPrefLang == "en"){
      language = const Locale("en");
      appTheme = themeEnglish;
    }
    else{
      language = Locale(Get.deviceLocale!.languageCode);
      appTheme = themeEnglish;
    }
    super.onInit();
  }
}