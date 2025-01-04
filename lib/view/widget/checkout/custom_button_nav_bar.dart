import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/checkout_controller.dart';
import '../../../core/constant/routes.dart';
import '../cart/custom_button_cart.dart';

class CustomButtonNavBar extends StatelessWidget {
  const CustomButtonNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CheckoutController>(
      builder: (controller) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: CustomButtonCart(
          title: controller.currentStep == 0
              ? "157".tr
              : controller.currentStep == 1
                  ? "158".tr
                  : "104".tr,
          onPressed: () {
            if (controller.currentStep == 0) {
              if (controller.receiptType == null) {
                Get.snackbar("159".tr, "160".tr,
                    messageText: Text(
                      "160".tr,
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          fontWeight: FontWeight.w700,
                          color: Colors.black.withOpacity(0.4)),
                    ));
                return;
              }
              if (controller.dataAddress.isEmpty) {
                Get.snackbar("159".tr, "161".tr,
                    messageText: Text(
                      "161".tr,
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          fontWeight: FontWeight.w700,
                          color: Colors.black.withOpacity(0.4)),
                    ));
              } else {
                controller.nextStep();
              }
            } else if (controller.currentStep == 1) {
              if (controller.paymentType == null) {
                Get.snackbar("159".tr, "162".tr,
                    messageText: Text(
                      "162".tr,
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          fontWeight: FontWeight.w700,
                          color: Colors.black.withOpacity(0.4)),
                    ));
                return;
              }
              controller.checkout();
            } else {
              Get.offAllNamed(AppRoute.home);
            }
          },
        ),
      ),
    );
  }
}
