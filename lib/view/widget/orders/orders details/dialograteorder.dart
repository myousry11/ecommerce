import 'package:ecommerce/controller/orders/orders_delivered_controller.dart';
import 'package:ecommerce/controller/productdetails_controller.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/core/constant/imageassets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rating_dialog/rating_dialog.dart';

import '../../../../controller/orders/orders_details_controller.dart';

// show the dialog
void showDialogRatingOrder(BuildContext context, String orderId){
  showDialog(
    context: context,
    barrierDismissible: true, // set to false if you want to force a rating
    builder: (context) => RatingDialog(
      initialRating: 1.0,
      // your app's name?
      title: Text(
        '200'.tr,
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
      ),
      // encourage your user to leave a high rating?
      message: Text(
        '196'.tr,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: 16),
      ),
      // your app's logo?
      image: Image.asset(AppImageAsset.rate, height: 80,),
      submitButtonText: '197'.tr,
      commentHint: '198'.tr,
      onCancelled: () {},
      submitButtonTextStyle: Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: 16, color: AppColor.primaryColor),
      onSubmitted: (response) {
        OrdersDetailsController controller = Get.find();
        // print('rating: ${response.rating}, comment: ${response.comment}');
        controller.submitOrder(orderId, response.rating, response.comment);
      },
    ),
  );
}