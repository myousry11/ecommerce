import 'dart:convert';
import 'dart:typed_data';
import 'package:ecommerce/controller/home_controller.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/data/model/itemsmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/imageassets.dart';
import '../../../core/functions/translatedatabase.dart';

class ListItemsHome extends StatelessWidget {
  final bool isTopSelling; // إذا كان العرض للعناصر الأكثر مبيعًا

  const ListItemsHome({super.key, this.isTopSelling = false});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: GetBuilder<HomeControllerImp>(
        builder: (controller) {
          if (controller.categories.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          }

          // الحصول على العناصر بناءً على الفئة المحددة
          String categoryId = controller.categories[controller.selectedCat]['categories_id'].toString();
          List currentItems = isTopSelling
              ? controller.topSellingCategoryItems[categoryId] ?? [] // العناصر الأكثر مبيعًا
              : controller.categoryItems[categoryId] ?? []; // جميع العناصر

          if (currentItems.isEmpty) {
            return Center(
              child: Text(
                isTopSelling ? 'No top-selling items available.' : 'No items available for this category.',
              ),
            );
          }

          return ListView.builder(
            itemCount: currentItems.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, i) {
              return Items(
                itemsModel: ItemsModel.fromJson(currentItems[i]),
              );
            },
          );
        },
      ),
    );
  }
}

class Items extends StatelessWidget {
  final ItemsModel itemsModel;

  const Items({super.key, required this.itemsModel});

  @override
  Widget build(BuildContext context) {
    String base64String = "${itemsModel.itemsImage}";
    Uint8List bytes = base64Decode(base64String);

    return GetBuilder<HomeControllerImp>(builder: (controller) {
      return GestureDetector(
        onTap: () {
          controller.goToPageProduct(itemsModel);
        },
        child: Container(
          padding: const EdgeInsets.fromLTRB(25.0, 0, 10, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: AppColor.grey.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    height: 190,
                    width: 140,
                  ),
                  Image.memory(
                    height: 190,
                    bytes,
                    fit: BoxFit.contain,
                  ),
                  if (itemsModel.itemsDiscount != 0)
                    Positioned(
                      top: 4,
                      left: 4,
                      child: Transform.rotate(
                        angle: -0.5,
                        child: Image.asset(
                          AppImageAsset.sale,
                          width: 40,
                        ),
                      ),
                    ),
                ],
              ),
              const SizedBox(height: 5),
              Text(
                "${translateDatabase(itemsModel.itemsNameAr, itemsModel.itemsName)}",

                style: Theme.of(context).textTheme.bodySmall!.copyWith(color: AppColor.black,fontSize: 16, fontWeight: FontWeight.w700),
              ),
              Row(
                children: [
                  Text(
                    "${itemsModel.itemsPriceDiscount}",
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(width: 5),
                  Text(
                    "62".tr,
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(width: 5),
                  Text(
                    "${itemsModel.itemsPrice}",
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: 14, color: Colors.grey.withOpacity(0.7), decoration: TextDecoration.lineThrough, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(width: 5),
                  Text(
                    "62".tr,
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: 14, color: Colors.grey.withOpacity(0.7)),
                  ),
                ],
              ),

            ],
          ),
        ),
      );
    });
  }
}
