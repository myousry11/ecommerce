import 'package:ecommerce/view/widget/cart/custom_button_cart.dart';
import 'package:flutter/material.dart';

import '../../../core/constant/color.dart';
import '../productdetails/custom_line_divider.dart';
class CustomBottomNav extends StatelessWidget {
  final String productPrice;
  final String shipping;
  final String totalPrice;
  final TextEditingController controllerCoupon;
  final void Function()? onApplyCoupon;
  const CustomBottomNav({super.key, required this.productPrice, required this.shipping, required this.totalPrice, required this.controllerCoupon, this.onApplyCoupon});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
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
          Container(
            child: TextFormField(
              controller: controllerCoupon,
              decoration: InputDecoration(
                hintText: "Have a code? type it here...",
                hintStyle: TextStyle(
                  color: Colors.grey, // اللون الرمادي للنص
                  fontSize: 16, // حجم النص
                ),
                suffixIcon: TextButton(
                  onPressed: onApplyCoupon,
                  child: Text(
                    "Validate",
                    style: TextStyle(
                      color: Colors.green, // اللون الأخضر لكلمة "Validate"
                      fontWeight: FontWeight.bold, // النص عريض
                    ),
                  ),
                ),
                filled: true,
                fillColor: Colors.grey.shade100, // اللون الخلفي
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12), // الحواف المستديرة
                  borderSide: BorderSide.none, // إزالة الحدود
                ),
                isDense: true,
                contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 10)
              ),
            ),

          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Product price", style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 16)),
              Text("$productPrice EGP", style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 16)),
            ],
          ),
          SizedBox(height: 8),
          CustomLineDivider(),
          SizedBox(height: 8,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                  "Shipping",
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 16),
              ),
              Text(
                  shipping,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 16),
              ),
            ],
          ),
          SizedBox(height: 8),
          CustomLineDivider(),
          SizedBox(height: 8,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                  "Total Price",
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 18, color: AppColor.primaryColor, fontWeight: FontWeight.w900)
              ),
              Text(
                  "$totalPrice EGP",
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 18, color: AppColor.primaryColor, fontWeight: FontWeight.w900)
              ),
            ],
          ),
          SizedBox(height: 20),
          CustomButtonCart(
            title: "Proceed to checkout",
            onPressed: (){},
          ),
        ],
      ),
    );
  }
}
