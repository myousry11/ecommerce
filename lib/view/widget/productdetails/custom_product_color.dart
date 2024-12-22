import 'package:ecommerce/controller/productdetails_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/color.dart';
class CustomProductColor extends GetView<ProductDetailsControllerImp> {
  const CustomProductColor({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: controller.colors.map((color) {
        bool isSelected = controller.selectedColor == color;
        return GestureDetector(
          onTap: () {
            controller.selectColor(color);
          },
          child: AnimatedContainer(
            margin: const EdgeInsets.symmetric(horizontal: 6), // تباعد بين الدوائر
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: isSelected
                  ? [
                BoxShadow(
                    color: AppColor.black.withOpacity(0.1),
                    blurRadius: 15,
                    blurStyle: BlurStyle.outer
                ),
              ]
                  : [],
              border: Border.all(
                color: isSelected ? AppColor.white : Colors.transparent,
                width: 1, // عرض الإطار الأبيض
              ),
            ),
            duration: const Duration(milliseconds: 300),
            child: CircleAvatar(
              radius: 10 , // حجم الدائرة
              backgroundColor: color,
            ),
          ),
        );
      }).toList(),
    );
  }
}
