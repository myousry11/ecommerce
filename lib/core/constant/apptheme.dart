import 'package:flutter/material.dart';

import 'color.dart';

ThemeData themeEnglish = ThemeData(
  floatingActionButtonTheme: FloatingActionButtonThemeData(backgroundColor: AppColor.primaryColor,),
  fontFamily: 'ProductSans',
  textTheme: TextTheme(
    headlineLarge: TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 22,
      color: AppColor.black,
      decoration: TextDecoration.none,
      letterSpacing: 2,
    ),
    headlineSmall: TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 14,
      color: AppColor.black,
      decoration: TextDecoration.none,
      letterSpacing: 1,
    ),
    bodySmall: TextStyle(
      height: 2,
      color: AppColor.black,
      fontSize: 13,
      fontWeight: FontWeight.w500,
      decoration: TextDecoration.none,
      letterSpacing: 1,
    ),
    bodyLarge: TextStyle(
      fontSize: 22,
      color: AppColor.black,
      fontWeight: FontWeight.w700,
      decoration: TextDecoration.none,
      letterSpacing: 2,
    ),
    bodyMedium: TextStyle(
      fontSize: 18,
      color: AppColor.black,
      fontWeight: FontWeight.w500,
      decoration: TextDecoration.none,
      letterSpacing: 1,
    ),
    displaySmall:
    TextStyle(
      fontSize: 14,
      color: AppColor.black,
      fontWeight: FontWeight.w300,
      decoration: TextDecoration.none,
      letterSpacing: 1, // buttons
    ),
    displayMedium: TextStyle(
      fontSize: 18,
      color: AppColor.black,
      fontWeight: FontWeight.w700,
      decoration: TextDecoration.none,
      letterSpacing: 1,
    ),
    displayLarge: TextStyle(
      fontSize: 22,
      color: AppColor.black,
      fontWeight: FontWeight.w900,
      decoration: TextDecoration.none,
      letterSpacing: 2,
    ),
  ),
  useMaterial3: true,
  primarySwatch: Colors.blue,
);

ThemeData themeArabic = ThemeData(
  fontFamily: 'Cairo',
  textTheme: TextTheme(
    headlineLarge: TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 22,
      color: AppColor.black,
      decoration: TextDecoration.none,
    ),
    headlineSmall: TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 14,
      color: AppColor.black,
      decoration: TextDecoration.none,
    ),
    bodySmall: TextStyle(
      height: 2,
      color: AppColor.grey,
      fontSize: 13,
      fontWeight: FontWeight.w500,
      decoration: TextDecoration.none,
    ),
    bodyLarge: TextStyle(
      fontSize: 22,
      color: AppColor.black,
      fontWeight: FontWeight.w700,
      decoration: TextDecoration.none,
    ),
    bodyMedium: TextStyle(
      fontSize: 18,
      color: AppColor.black,
      fontWeight: FontWeight.w500,
      decoration: TextDecoration.none,
    ),
    displaySmall:  //buttons
    TextStyle(
      fontSize: 14,
      color: AppColor.black,
      fontWeight: FontWeight.w300,
      decoration: TextDecoration.none,
    ),
    displayMedium: TextStyle(
      fontSize: 18,
      color: AppColor.black,
      fontWeight: FontWeight.w700,
      decoration: TextDecoration.none,
    ),
    displayLarge: TextStyle(
      fontSize: 22,
      color: AppColor.black,
      fontWeight: FontWeight.w900,
      decoration: TextDecoration.none,
    ),
  ),
  useMaterial3: true,
  primarySwatch: Colors.blue,
);