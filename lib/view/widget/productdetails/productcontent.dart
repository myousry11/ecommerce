import 'package:ecommerce/controller/productdetails_controller.dart';
import 'package:ecommerce/view/widget/productdetails/custom_line_divider.dart';
import 'package:ecommerce/view/widget/productdetails/custom_product_color.dart';
import 'package:ecommerce/view/widget/productdetails/custom_product_reviews.dart';
import 'package:ecommerce/view/widget/productdetails/custom_product_size.dart';
import 'package:ecommerce/view/widget/productdetails/custom_product_toggle_subTitle.dart';
import 'package:ecommerce/view/widget/productdetails/custom_text_colorsize.dart';
import 'package:ecommerce/view/widget/productdetails/custom_title_price.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/color.dart';
import '../../../core/functions/translatedatabase.dart';

class ProductContent extends StatelessWidget {
  const ProductContent({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductDetailsControllerImp>(
        builder: (controller) {
          var reviews = controller.getReviews();  // استدعاء دالة التقييمات
          double averageRating = reviews['averageRating'] ?? 0.0;
          int reviewCount = reviews['reviewCount'] ?? 0;

          return Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(35),
                topRight: Radius.circular(35),
              ),
            ),
            child: Align(
              alignment: Alignment.topCenter,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    CustomTitleAndPrice(
                        itemName: translateDatabase(
                            controller.itemsModel.itemsNameAr, controller.itemsModel.itemsName),
                        itemPrice: "${controller.itemsModel.itemsPriceDiscount} ${"62".tr}"
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          children: [
                            ...List.generate(
                              5,
                                  (index) => Icon(
                                index < averageRating.floor() ? Icons.star : Icons.star_border,
                                color: Colors.orange,
                                size: 18,
                              ),
                            ),
                            const SizedBox(width: 5),
                            Text("($reviewCount ${"165".tr})", style: const TextStyle(color: Colors.grey)),
                          ],
                        ),
                        const SizedBox(width: 80,),
                        Text(
                          "${controller.itemsModel.itemsPrice} ${"62".tr}",
                            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                                fontSize: 16,
                                color: Colors.grey,
                                decoration: TextDecoration.lineThrough,
                              fontWeight: FontWeight.w700
                            ),
                        )
                      ],
                    ),
                    const SizedBox(height: 10),
                    const CustomLineDivider(),
                    const CustomTextColorAndSize(),
                    const SizedBox(height: 10),
                    const Row(
                      children: [
                        CustomProductColor(),
                        Spacer(),
                        CustomProductSize(),
                      ],
                    ),
                    const SizedBox(height: 10),
                    const CustomLineDivider(),
                    CustomProductToggleSubtitle(
                        title: '164'.tr,
                        content: translateDatabase(controller.itemsModel.itemsDescriptionAr, controller.itemsModel.itemsDescription),
                        onTap: () {
                          controller.toggleDescription();
                        }
                    ),
                    const SizedBox(height: 5),
                    const CustomLineDivider(),
                     CustomProductReviews(
                        title: "165".tr,
                    ),
                  ],
                ),
              ),
            ),
          );
        }
    );
  }
}
