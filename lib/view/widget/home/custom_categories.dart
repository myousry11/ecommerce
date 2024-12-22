import 'dart:convert';
import 'dart:typed_data';

import 'package:ecommerce/controller/home_controller.dart';
import 'package:ecommerce/core/functions/translatedatabase.dart';
import 'package:ecommerce/data/model/categoriesmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/color.dart';

class CustomCategoriesListHome extends GetView<HomeControllerImp> {
  const CustomCategoriesListHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 10),
      height: 80,
      child: GetBuilder<HomeControllerImp>(
        builder: (controller) {
          return ListView.separated(
            separatorBuilder: (context, index) => const SizedBox(width: 40),
            itemCount: controller.categories.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Category(
                categoriesModel:
                    CategoriesModel.fromJson(controller.categories[index]),
                i: index,
              );
            },
          );
        },
      ),
    );
  }
}

class Category extends GetView<HomeControllerImp> {
  final int? i;
  final CategoriesModel categoriesModel;
  const Category({
    super.key,
    required this.categoriesModel,
    required this.i,
  });

  @override
  Widget build(BuildContext context) {
    String base64String = "${categoriesModel.categoriesImage}";
    Uint8List bytes = base64Decode(base64String);

    return GetBuilder<HomeControllerImp>(
      builder: (controller) => GestureDetector(
        onTap: () {
          controller.changeCat(i!); // استدعاء تغيير الفئة
        },
        child: Column(
          children: [
            Container(
              decoration: controller.selectedCat == i
                  ? BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(25),
              )
                  : null,
              width: 50,
              height: 50,
              child: Image.memory(bytes),
            ),
            const SizedBox(height: 10),
            Text(
              "${translateDatabase(categoriesModel.categoriesNameAr, categoriesModel.categoriesName)}",
              style: TextStyle(
                fontSize: 13,
                color: controller.selectedCat == i ? Colors.blue : AppColor.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
