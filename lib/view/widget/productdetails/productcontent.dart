import 'package:ecommerce/controller/productdetails_controller.dart';
import 'package:ecommerce/view/widget/productdetails/custom_line_divider.dart';
import 'package:ecommerce/view/widget/productdetails/custom_product_color.dart';
import 'package:ecommerce/view/widget/productdetails/custom_product_size.dart';
import 'package:ecommerce/view/widget/productdetails/custom_product_toggle_subTitle.dart';
import 'package:ecommerce/view/widget/productdetails/custom_text_colorsize.dart';
import 'package:ecommerce/view/widget/productdetails/custom_title_price.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/color.dart';

class ProductContent extends StatelessWidget {
  const ProductContent({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductDetailsControllerImp>(
        builder: (controller) => Container(
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
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomTitleAndPrice(
                          itemName: "${controller.itemsModel.itemsName}",
                          itemPrice: "${controller.itemsModel.itemsPrice} EGP"),
                      const SizedBox(height: 10),
                      Row(
                        children: const [
                          Icon(Icons.star, color: Colors.orange, size: 18),
                          Icon(Icons.star, color: Colors.orange, size: 18),
                          Icon(Icons.star, color: Colors.orange, size: 18),
                          Icon(Icons.star, color: Colors.orange, size: 18),
                          Icon(Icons.star_half, color: Colors.orange, size: 18),
                          SizedBox(width: 5),
                          Text("(83 Reviews)",
                              style: TextStyle(color: Colors.grey)),
                        ],
                      ),
                      const SizedBox(height: 10),
                      CustomLineDivider(),
                      CustomTextColorAndSize(),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          CustomProductColor(),
                          Spacer(),
                          CustomProductSize(),
                        ],
                      ),
                      const SizedBox(height: 10),
                      CustomLineDivider(),
                      CustomProductToggleSubtitle(
                          title: 'Description',
                          content: "${controller.itemsModel.itemsDescription}",
                          onTap: () {
                            controller.toggleDescription();
                          }),
                      const SizedBox(height: 10),
                      CustomLineDivider(),
                      ListTile(
                        title: Text("Reviews",
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(fontSize: 22)),
                        trailing: const Icon(Icons.arrow_forward_ios, size: 18),
                        onTap: () {},
                      ),
                    ],
                  ),
                ),
              ),
            ));
  }
}
