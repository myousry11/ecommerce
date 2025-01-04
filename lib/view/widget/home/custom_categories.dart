import 'dart:convert';
import 'dart:typed_data';

import 'package:ecommerce/controller/home_controller.dart';
import 'package:ecommerce/core/functions/translatedatabase.dart';
import 'package:ecommerce/data/model/categoriesmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

class Category extends StatefulWidget {
  final int? i;
  final CategoriesModel categoriesModel;
  final int? Function(int? id)? changeCategory;
  const Category({
    super.key,
    required this.categoriesModel,
    required this.i, this.changeCategory,
  });

  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  @override
  Widget build(BuildContext context) {
    // SharedPreferences sharedPreferences = SharedPreferences.getInstance() as SharedPreferences;
    int selectedId = 1;
    String base64String = "${widget.categoriesModel.categoriesImage}";
    Uint8List bytes = base64Decode(base64String);

    return GetBuilder<HomeControllerImp>(
      builder: (controller) => GestureDetector(
        onTap: () {
          controller.changeCat(widget.i!);
          setState(() {

          });
        },
        child: Column(
          children: [
            Container(
              decoration: controller.selectedCat == widget.i
                  ? BoxDecoration(
                color: AppColor.primaryColor,
                borderRadius: BorderRadius.circular(25),
              )
                  : null,
              width: 50,
              height: 50,
              child: Image.memory(bytes),
            ),
            const SizedBox(height: 10),
            Text(
              "${translateDatabase(widget.categoriesModel.categoriesNameAr, widget.categoriesModel.categoriesName)}",
              style: TextStyle(
                fontSize: 13,
                color: controller.selectedCat == widget.i ? Colors.blue : AppColor.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
