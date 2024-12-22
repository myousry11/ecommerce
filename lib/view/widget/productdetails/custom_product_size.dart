import 'package:ecommerce/controller/productdetails_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/color.dart';
class CustomProductSize extends GetView<ProductDetailsControllerImp> {
  const CustomProductSize({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: controller.sizes.map((size) {
        bool isSelected = controller.selectedSize == size;
        return GestureDetector(
          onTap: () {
            controller.selectSize(size);
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 400),
            margin: const EdgeInsets.symmetric(horizontal: 6), // التباعد بين المقاسات
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
                color: isSelected ? AppColor.black : AppColor.grey.withOpacity(0.3),
                shape: BoxShape.circle
            ),
            child: Text(
              size,
              style: TextStyle(
                color: isSelected ? AppColor.white : AppColor.black,
                fontSize: 15,
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
