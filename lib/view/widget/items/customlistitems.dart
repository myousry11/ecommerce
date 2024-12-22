import 'package:ecommerce/controller/items_controller.dart';
import 'package:ecommerce/core/functions/translatedatabase.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/color.dart';
import '../../../data/model/itemsmodel.dart';
import 'dart:convert';
import 'dart:typed_data';

class CustomListItems extends GetView<ItemsControllerImp> {
  final ItemsModel itemsModel;
  final bool active;
  const CustomListItems({super.key, required this.itemsModel, required this.active});

  @override
  Widget build(BuildContext context) {

        // فك تشفير الصورة
        String base64String = "${itemsModel.itemsImage}";
        Uint8List bytes = base64Decode(base64String);

        return GestureDetector(
          onTap: () {
            controller.goToPageProduct(itemsModel);
          },
          child: Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1), // لون الظل خفيف
                  spreadRadius: 1,
                  blurRadius: 6,
                  offset: Offset(0, 2), // موقع الظل
                ),
              ],
              borderRadius: BorderRadius.circular(40), // تعديل الحواف ليكون أكثر دائرية
            ),
            child: Card(
              color: AppColor.white,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Hero(
                          tag: "${itemsModel.itemsId}",
                          child: Image.memory(
                            bytes,
                            width: 150,
                            height: 180,
                            fit: BoxFit.contain,
                          ),
                        ),
                        const SizedBox(height: 5),
                         Column(
                           crossAxisAlignment: CrossAxisAlignment.start,
                           children: [
                             Text(
                               translateDatabase(itemsModel.itemsNameAr, itemsModel.itemsName),
                               style: Theme.of(context).textTheme.bodySmall,
                             ),
                             Text("Description"),
                             Text("${itemsModel.itemsPrice}"),
                           ],
                         )
                      ],
                    ),
                  ),
                  Positioned(
                    right: 10,
                    top: 10,
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white),
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon( active ? Icons.favorite : Icons.favorite_border_outlined,
                          size: 25,
                          color: Colors.orange,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
  }
}
