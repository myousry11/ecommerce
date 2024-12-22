import 'dart:convert';
import 'dart:typed_data';

import 'package:ecommerce/controller/productdetails_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/color.dart';
class ProductImage extends GetView<ProductDetailsControllerImp> {
  const ProductImage({super.key});

  @override
  Widget build(BuildContext context) {
    String base64String = controller.itemsModel.itemsImage ?? "";
    Uint8List? bytes =
    base64String.isNotEmpty ? base64Decode(base64String) : null;
    return Stack(
      children: [
        Center(
          child: Stack(
            children: [
              Positioned(
                right: 80,
                top: 150,
                child: Container(
                  height: 250,
                  width: 250,
                  decoration: BoxDecoration(
                    color: AppColor.primaryColor.withOpacity(0.5),
                    shape: BoxShape.circle,
                  ),
                ),
              ),
              Positioned(
                top: 30,
                right: 70,
                child: Center(
                  child: Hero(
                    tag: "${controller.itemsModel.itemsId}",
                    child: Image.memory(
                      bytes!,
                      height: 500,
                      width: 250, // Add width for proper constraints
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
