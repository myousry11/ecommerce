import 'package:ecommerce/controller/orders/orderview_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/color.dart';

class CustomOrderTypeButton extends StatelessWidget {
  final String text;
  final int index;

  const CustomOrderTypeButton(this.text, this.index, {super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrderController>(
      builder: (controller) {
        return GestureDetector(
          onTap: () {
            controller.updateSelectedIndex(index);
          },
          child: Container(
            decoration: BoxDecoration(
              color: controller.selectedIndex == index
                  ? AppColor.primaryColor.withOpacity(0.2)
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(20),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            child: Text(
              text,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: controller.selectedIndex == index
                    ? AppColor.primaryColor
                    : Colors.black,
              ),
            ),
          ),
        );
      },
    );
  }
}



// Widget _buildCategoryButton(String text, int index, OrderController controller) {
//   return GestureDetector(
//     onTap: () {
//       controller.updateSelectedIndex(index); // تحديث القسم المختار
//       pageController.jumpToPage(index);
//     },
//     child: Container(
//       decoration: BoxDecoration(
//         color: controller.selectedIndex == index
//             ? AppColor.primaryColor.withOpacity(0.2) // خلفية مميزة للمختار
//             : Colors.transparent,
//         borderRadius: BorderRadius.circular(20),
//       ),
//       padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
//       child: Text(
//         text,
//         style: TextStyle(
//           fontSize: 15,
//           fontWeight: FontWeight.bold,
//           color: controller.selectedIndex == index
//               ? AppColor.primaryColor
//               : Colors.black,
//         ),
//       ),
//     ),
//   );
// }