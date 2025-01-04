import 'package:ecommerce/controller/cart_controller.dart';
import 'package:ecommerce/view/widget/cart/custom_button_cart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/color.dart';
import '../productdetails/custom_line_divider.dart';
class CustomBottomNav extends StatelessWidget {
  final String productPrice;
  final String shipping;
  final String totalPrice;
  final String discount;
  final TextEditingController controllerCoupon;
  final void Function()? onApplyCoupon;
  final void Function()? onPressedCheckOut;
  const CustomBottomNav({super.key, required this.productPrice, required this.shipping, required this.totalPrice, required this.controllerCoupon, this.onApplyCoupon, required this.discount, this.onPressedCheckOut});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(30)),
        boxShadow: [
          BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              blurRadius: 3,
              spreadRadius: 1
          )
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          GetBuilder<CartController>(builder: (controller) =>
              Container(
            child: TextFormField(
              style: Theme.of(context).textTheme.bodyMedium,
              controller: controllerCoupon,
              decoration: InputDecoration(
                  hintText: "143".tr,
                  hintStyle: const TextStyle(
                    color: Colors.grey, // اللون الرمادي للنص
                    fontSize: 16, // حجم النص
                  ),
                  suffixIcon: InkWell(
                    onTap: onApplyCoupon,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        "144".tr,
                        style:Theme.of(context).textTheme.bodySmall!.copyWith(
                            color: Colors.grey.withOpacity(0.4),
                            fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                  filled: true,
                  fillColor: Colors.grey.shade100,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                  isDense: true,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10)
              ),
            ),

          )
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("141".tr, style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 16)),
              Text("$productPrice ${"62".tr}", style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 16)),
            ],
          ),
          const SizedBox(height: 8),
          const CustomLineDivider(),
          const SizedBox(height: 8,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                  "140".tr,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 16),
              ),
              Text(
                  shipping,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 16),
              ),
            ],
          ),
          const SizedBox(height: 8),
          const CustomLineDivider(),
          const SizedBox(height: 8,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "145".tr,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 16),
              ),
              Text(
                discount,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 16),
              ),
            ],
          ),
          const SizedBox(height: 8),
          const CustomLineDivider(),
          const SizedBox(height: 8,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                  "146".tr,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 18, color: AppColor.primaryColor, fontWeight: FontWeight.w900)
              ),
              Text(
                  "$totalPrice ${"62".tr}",
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 18, color: AppColor.primaryColor, fontWeight: FontWeight.w900)
              ),
            ],
          ),
          const SizedBox(height: 20),
          CustomButtonCart(
            title: "147".tr,
            onPressed: onPressedCheckOut,
          ),
        ],
      ),
    );
  }
}
