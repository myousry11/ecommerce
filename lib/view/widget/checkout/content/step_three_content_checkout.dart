import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../../../core/constant/imageassets.dart';
import '../custom_sub_title_checkout.dart';

class StepThreeContentCheckout extends StatelessWidget {
  const StepThreeContentCheckout({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomSubTitleCheckout(title: "154".tr),
        Lottie.asset(AppImageAsset.orderCompleted),
        Text(
            textAlign: TextAlign.center,
            "${"155".tr} \n ${"156".tr}",
            style: Theme.of(context)
                .textTheme
                .bodySmall!
                .copyWith(fontSize: 18, fontWeight: FontWeight.w500))
      ],
    );
  }
}
