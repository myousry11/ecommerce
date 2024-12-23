import 'dart:convert';
import 'dart:typed_data';
import 'package:ecommerce/controller/home_controller.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/data/model/itemsmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListItemsHome extends GetView<HomeControllerImp> {
  const ListItemsHome({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 265,
      child: GetBuilder<HomeControllerImp>(
        builder: (controller) {
          if (controller.categories.isEmpty) {
            return Center(child: CircularProgressIndicator());
          }

          String categoryId = controller.categories[controller.selectedCat]['categories_id'].toString();
          List currentItems = controller.categoryItems[categoryId] ?? [];

          if (currentItems.isEmpty) {
            return Center(child: Text('No items available for this category.'));
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

    return GetBuilder<HomeControllerImp>(builder: (controller) => GestureDetector(
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
              ],
            ),
            const SizedBox(height: 9),
            Text(
              "${itemsModel.itemsName}",
              style: Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: 14),
            ),
            const SizedBox(height: 2),
            Row(
              children: [
                Text(
                  "${itemsModel.itemsPrice}",
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: 18),
                ),
                const SizedBox(width: 5),
                Text(
                  "EGP",
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: 18),
                ),
              ],
            ),
          ],
        ),
      ),
    ));
  }
}
