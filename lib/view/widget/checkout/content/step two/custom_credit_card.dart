import 'package:ecommerce/controller/checkout_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/constant/color.dart';

class CustomCreditCard extends StatelessWidget {
  const CustomCreditCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CheckoutController>(builder: (controller) => Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "153".tr,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 20, fontWeight: FontWeight.w700),
              ),
              TextButton(
                onPressed: () {
                  controller.goToAddNewAddress();
                },
                child: Text(
                  "151".tr,
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(color: AppColor.primaryColor),
                ),
              )
            ],
          ),
        ),
        const SizedBox(height: 5,),
        Container(
          height: 200,
          margin: const EdgeInsets.only(left: 20),
          child: ListView.separated(
            separatorBuilder: (context, index) =>
                const SizedBox(width: 10),
            itemCount: 2,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Container(
                height: 50,
                width: 300,
                color: Colors.blue,
              );
            },
          ),
        ),
      ],
    ));
  }
}
