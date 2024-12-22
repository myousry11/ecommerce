import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';

import '../../../core/constant/color.dart';
class CartItem extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String count;
  final String price;
  final String size;
  final String color;
  final void Function()? onAdd;
  final void Function()? onRemove;
  const CartItem({super.key, required this.imageUrl, required this.title, required this.price, required this.size, required this.color, this.onAdd, this.onRemove, required this.count});

  @override
  Widget build(BuildContext context) {
    // String base64String = controller.itemsModel.itemsImage ?? "";
// Uint8List? bytes =
// base64String.isNotEmpty ? base64Decode(base64String) : null;
    return Container(
      height: 135,
      child: Card(
        color: AppColor.white,
        elevation: 5,
        margin: EdgeInsets.symmetric(horizontal: 16),
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 1,
                child: Image.memory(
                  base64Decode(imageUrl),
                  width: 200,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(width: 16),
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 4),
                    Text(
                      price,
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(height: 4),
                    Text(
                      "Size: $size | Color: $color",
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(height: 8),
                    Container(
                      height: 35,
                      width: 90,
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      margin: EdgeInsets.only(bottom: 5),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Expanded(
                            child: IconButton(
                              onPressed: onRemove,
                              icon: Icon(Icons.remove, size: 15),
                              padding: EdgeInsets.zero,
                              constraints: BoxConstraints(),
                            ),
                          ),
                          Expanded(
                              child: Text(
                                count,
                                style: TextStyle(fontSize: 15),
                                textAlign: TextAlign.center,
                              )),
                          Expanded(
                            child: IconButton(
                              onPressed: onAdd,
                              icon: Icon(Icons.add, size: 15),
                              padding: EdgeInsets.zero,
                              constraints: BoxConstraints(),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );;
  }
}