import 'package:ecommerce/controller/checkout_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/constant/iconassets.dart';
import '../../card_payment_method_checkout.dart';
import '../../custom_step_title_number.dart';
import '../../custom_sub_title_checkout.dart';
class CustomChoosePayment extends StatelessWidget {
  const CustomChoosePayment({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CheckoutController>(builder:(controller) => Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomStepTitleNumber(title: '${"149".tr} 2'),
        const SizedBox(height: 5),
        CustomSubTitleCheckout(title: "152".tr),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CardPaymentMethodCheckOut(
              title: "138".tr,
              isActive: controller.paymentType == "0",
              onTap: () {
                controller.choosePaymentMethod("0");
              }, image: AppIconAsset.cash,
            ),
            const SizedBox(width: 10),
            CardPaymentMethodCheckOut(
              title: "139".tr,
              isActive: controller.paymentType == "1",
              onTap: () {
                controller.choosePaymentMethod("1");
              }, image: AppIconAsset.creditCardTwo,
            ),
          ],
        )
      ],
    ));
  }
}
