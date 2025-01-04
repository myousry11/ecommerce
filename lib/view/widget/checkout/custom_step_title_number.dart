import 'package:ecommerce/core/constant/color.dart';
import 'package:flutter/material.dart';

class CustomStepTitleNumber extends StatelessWidget {
  final String title;
  const CustomStepTitleNumber({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: Theme.of(context)
          .textTheme
          .headlineLarge!
          .copyWith(fontWeight: FontWeight.w500, fontSize: 16, color: AppColor.grey),
    );
  }
}
