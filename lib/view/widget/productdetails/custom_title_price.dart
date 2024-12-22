import 'package:ecommerce/controller/productdetails_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class CustomTitleAndPrice extends StatelessWidget {
  final String itemName;
  final String itemPrice;
  const CustomTitleAndPrice({super.key, required this.itemName, required this.itemPrice});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          itemName,
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 23),
        ),
        Text(
          itemPrice,
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 20),
        ),
      ],
    );
  }
}
