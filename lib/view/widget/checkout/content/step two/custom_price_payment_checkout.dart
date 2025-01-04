import 'package:ecommerce/controller/checkout_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/constant/color.dart';
import '../../../productdetails/custom_line_divider.dart';
class CustomPricePaymentCheckout extends StatelessWidget {
  const CustomPricePaymentCheckout({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CheckoutController>(builder: (controller) => Container(
      padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("141".tr, style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 16)),
              Text("${controller.priceOrders} ${"62".tr}", style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 16)),
            ],
          ),
          const SizedBox(height: 5),
          const CustomLineDivider(),
          const SizedBox(height: 5,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "140".tr,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 16),
              ),
              Text(
                "Free",
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 16),
              ),
            ],
          ),
          const SizedBox(height: 5),
          const CustomLineDivider(),
          const SizedBox(height: 5,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "145".tr,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 16),
              ),
              Text(
                "${controller.discountCoupon} %",
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 16),
              ),
            ],
          ),
          const SizedBox(height: 5),
          const CustomLineDivider(),
          const SizedBox(height: 5,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                  "146".tr,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 18, color: AppColor.primaryColor, fontWeight: FontWeight.w900)
              ),
              Text(
                  "${controller.totalPrice} ${"62".tr}",
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 18, color: AppColor.primaryColor, fontWeight: FontWeight.w900)
              ),
            ],
          ),
        ],
      ),
    ));
  }
}
