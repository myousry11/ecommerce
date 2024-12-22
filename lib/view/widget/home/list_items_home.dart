import 'dart:convert';
import 'dart:typed_data';
import 'package:ecommerce/controller/home_controller.dart';
import 'package:ecommerce/controller/items_controller.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/data/model/itemsmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/class/statusrequest.dart';

class ListItemsHome extends GetView<HomeControllerImp> {
  const ListItemsHome({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 265,
      child: GetBuilder<HomeControllerImp>(
        builder: (controller) {

          // تحقق من أن categoryItems تحتوي على عناصر للفئة المحددة
           List currentItems = controller.categoryItems[controller.categories[controller.selectedCat]['categories_id'].toString()] ?? [];
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

    return GetBuilder<ItemsControllerImp>(
      builder: (controller) => GestureDetector(
        onTap: () {
          controller.goToPageProduct(itemsModel);
        },
        child: Container(
          padding: const EdgeInsets.fromLTRB(25.0, 0, 10, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // صورة المنتج داخل Stack
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
                ],
              ),
              SizedBox(
                height: 9,
              ),
              Text(
                "${itemsModel.itemsName}",
                style: Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: 14),
              ),
              const SizedBox(height: 2),
              // سعر المنتج
              Row(
                children: [
                  Text(
                    "${itemsModel.itemsPrice}",
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: 18),
                  ),
                  SizedBox(width: 5),
                  Text(
                    "EGP",
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: 18),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
