import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/view/widget/orders/orders%20details/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomOrdersButtons extends StatelessWidget {
  final String orderStatus;
  final VoidCallback onCancelOrder;
  final VoidCallback onContinueShopping;
  final VoidCallback? onReturnHome;
  final VoidCallback? onRateOrder;
  final VoidCallback onDeleteOrder;
  final VoidCallback? onTrackOrder;
  final int ordersRating;  // Add ordersRating

  const CustomOrdersButtons({
    super.key,
    required this.orderStatus,
    required this.onCancelOrder,
    required this.onContinueShopping,
    this.onReturnHome,
    this.onRateOrder,
    required this.onDeleteOrder,
    required this.ordersRating, this.onTrackOrder, // Initialize ordersRating
  });

  @override
  Widget build(BuildContext context) {
    if (orderStatus == "85".tr) {
      return Row(
        children: [
          Expanded(
            child: CustomButton(
              title: '104'.tr,
              onPressed: onContinueShopping,
              color: Colors.white,
              textColor: AppColor.black.withOpacity(0.3),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: CustomButton(
              title: '105'.tr,
              onPressed: onCancelOrder,
              color: Colors.red,
              textColor: AppColor.white,
            ),
          ),
        ],
      );
    } else if (orderStatus == "84".tr) {
      if (ordersRating == 0) {
        // Show Rate button when ordersRating is 0
        return Row(
          children: [
            Expanded(
            child: CustomButton(
              title: '106'.tr,
              onPressed: onReturnHome,
              color: Colors.white,
              textColor: AppColor.black.withOpacity(0.3),
            ),
          ),
            const SizedBox(width: 10,),
            Expanded(
              child: CustomButton(
                title: '107'.tr,
                onPressed: onRateOrder,
                color: AppColor.primaryColor,
                textColor: AppColor.white,
              ),
            ),


          ],
        );
      } else {
        // Show Return Home button when ordersRating is not 0
        return Row(
          children: [
            Expanded(
              child: CustomButton(
                title: '106'.tr,
                onPressed: onReturnHome,
                color: Colors.white,
                textColor: AppColor.black.withOpacity(0.3),
              ),
            ),
          ],
        );
      }
    } else if (orderStatus == "89".tr) {
      return Row(
        children: [
          Expanded(
            child: ElevatedButton(
              onPressed: onReturnHome,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey[300],
              ),
              child: Text(
                '106'.tr,
                style: const TextStyle(color: Colors.black),
              ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: ElevatedButton(
              onPressed: onDeleteOrder,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
              ),
              child:  Text(
                '108'.tr,
                style: const TextStyle(color: Colors.black),
              ),
            ),
          ),
        ],
      );
    } else if (orderStatus == "87".tr) {
      return Row(
        children: [
          Expanded(
            child: ElevatedButton(
              onPressed: onContinueShopping,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey[300],
              ),
              child:  Text(
                '104'.tr,
                style: const TextStyle(color: Colors.black),
              ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: ElevatedButton(
              onPressed: onTrackOrder,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
              ),
              child: Text(
                '109'.tr,
                style: const TextStyle(color: Colors.black),
              ),
            ),
          ),
        ],
      );
    }
    else {
      return CustomButton(
        title: '104'.tr,
        onPressed: onContinueShopping,
        color: Colors.green,
        textColor: AppColor.white,
      );
    }
  }
}
