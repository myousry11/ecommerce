import 'dart:convert';
import 'dart:typed_data';

import 'package:ecommerce/controller/home_controller.dart';
import 'package:ecommerce/controller/items_controller.dart';
import 'package:ecommerce/core/functions/translatedatabase.dart';
import 'package:ecommerce/data/model/categoriesmodel.dart';
import 'package:ecommerce/data/model/subcategoriesmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/color.dart';

class CustomCategoriesListItems extends GetView<ItemsControllerImp> {
  const CustomCategoriesListItems({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 10),
      height: 80,
      child: GetBuilder<ItemsControllerImp>(
        builder: (controller) {

          return ListView.separated(
            separatorBuilder: (context, index) => const SizedBox(width: 40),
            itemCount: controller.subCategories.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return SubCategory(
                subCategoriesModel: controller.subCategories[index],
                i: index,
              );
            },
          );
        },
      ),
    );
  }
}

class SubCategory extends GetView<ItemsControllerImp> {
  final int? i;
  final SubCategoriesModel subCategoriesModel;
  const SubCategory({
    super.key,
    required this.subCategoriesModel,
    required this.i,
  });

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: () {
        controller.changeSubCategory(i!, subCategoriesModel.subCategoriesId.toString(), );
      },
      child: GetBuilder<ItemsControllerImp>(builder: (controller)=>  Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              decoration: controller.selectedCat == subCategoriesModel.subCategoriesId ? BoxDecoration(
                border: Border(
                  bottom: BorderSide(width: 3, color: AppColor.primaryColor)
                )
              ) : null,
              child: Text(
                translateDatabase(subCategoriesModel.subCategoriesNameAr, subCategoriesModel.subCategoriesName),
                style: TextStyle(
                  fontSize: 13,
                  color: controller.selectedCat == subCategoriesModel.subCategoriesId ? Colors.blue : AppColor.black,
                ),
              ),
            ),
          ],

      )),
    );
  }
}
