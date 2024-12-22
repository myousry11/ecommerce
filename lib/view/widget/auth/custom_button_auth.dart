import 'package:ecommerce/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomButtonAuth extends StatelessWidget {
  final String title;
  final void Function()? onPressed;
  final Color? buttonColor;

  const CustomButtonAuth({
    super.key,
    required this.title,
    this.onPressed,
    this.buttonColor,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 160,
      height: 55,
      child: Container(
        decoration: BoxDecoration(
          color: AppColor.grey,
          borderRadius: BorderRadius.circular(25),
        ),

        child: MaterialButton(
          color: buttonColor ?? AppColor.primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          onPressed: onPressed,
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18,
              fontFamily: Get.locale?.languageCode == 'ar' ? 'Cairo' : 'ProductSans',
              fontWeight: FontWeight.w700,
              letterSpacing: Get.locale?.languageCode == 'ar' ? 0 : 1,
            ),
          ),
        ),
      ),
    );
  }
}
