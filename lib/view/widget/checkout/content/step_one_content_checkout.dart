import 'package:ecommerce/controller/checkout_controller.dart';
import 'package:ecommerce/core/constant/iconassets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/constant/color.dart';
import '../../../../core/constant/imageassets.dart';
import '../card_address.dart';
import '../card_receipt_type.dart';
import '../custom_step_title_number.dart';
import '../custom_sub_title_checkout.dart';
class StepOneContentCheckout extends StatelessWidget {
  const StepOneContentCheckout({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CheckoutController>(builder: (controller) => Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomStepTitleNumber(title: '${"149".tr} 1'),
        const SizedBox(height: 5),
        CustomSubTitleCheckout(title: "140".tr),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CardReceiptTypeCheckout(
              title: "136".tr,
              image: AppIconAsset.shipping,
              isActive: controller.receiptType == "0",
              onTap: () {
                controller.chooseReceiptMethod("0");
              },
            ),
            const SizedBox(width: 20),
            CardReceiptTypeCheckout(
              title: "137".tr,
              image: AppImageAsset.store,
              isActive: controller.receiptType == "1",
              onTap: () {
                controller.chooseReceiptMethod("1");
              },
            ),
          ],
        ),
        const SizedBox(height: 25),
        if (controller.receiptType == "0")
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomSubTitleCheckout(title: "150".tr),
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
                  ),
                ],
              ),
              const SizedBox(height: 10),
              ...List.generate(
                controller.dataAddress.length,
                    (index) => CardShippingAddressCheckout(
                  title: '${controller.dataAddress[index].addressName}',
                  subTitle:
                  '${controller.dataAddress[index].addressCity} - ${controller.dataAddress[index].addressStreet}',
                  isActive: controller.addressId ==
                      controller.dataAddress[index].addressId.toString(),
                  onTap: () {
                    controller.chooseShippingAddress(
                        controller.dataAddress[index].addressId
                            .toString());
                  },
                ),
              ),
            ],
          ),
      ],
    ));
  }
}
