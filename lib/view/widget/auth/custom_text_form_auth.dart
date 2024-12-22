import 'package:ecommerce/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../bindings/initial_bindings.dart';

class CustomTextFormAuth extends GetView<AppBindings> {
  final String hintText;
  final String labelText;
  final IconData? suffixIcon;
  final Widget? prefixIcon;
  final void Function()? onPressed;
  final TextEditingController myController;
  final bool obscureText;
  final String? Function(String?) valid;
  final TextInputType? keyboardType;

  const CustomTextFormAuth({
    super.key,
    required this.hintText,
    required this.valid,
    required this.labelText,
    this.prefixIcon,
    this.suffixIcon,
    this.onPressed,
    this.keyboardType,
    required this.myController,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: TextFormField(
        keyboardType: keyboardType,
        validator: valid,
        obscureText: obscureText,
        controller: myController,
        style: const TextStyle(
          color: Colors.black,
          fontFamily: 'ProductSans',
          fontWeight: FontWeight.w500,
          fontSize: 14,
        ),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(
            fontFamily: Get.locale?.languageCode == 'ar' ? 'Cairo' : 'ProductSans',
            fontWeight: FontWeight.w500,
            fontSize: 14,
            color: AppColor.grey,
          ),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          labelText: labelText,
          labelStyle: TextStyle(
            fontFamily: Get.locale?.languageCode == 'ar' ? 'Cairo' : 'ProductSans',
            fontWeight: FontWeight.w700,
            fontSize: 20,
          ),
          prefixIcon: prefixIcon != null
              ? Container(
            padding: const EdgeInsets.all(10), // إضافة padding حسب الحاجة
            child: prefixIcon, // عرض الأيقونة أو الصورة إذا تم تمريرها
          )
              : null,
          suffixIcon: suffixIcon != null
              ? GestureDetector(
            onTap: onPressed,
            child: Icon(suffixIcon),
          )
              : null,
          contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
      ),
    );
  }
}
