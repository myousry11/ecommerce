import 'package:flutter/material.dart';
class CustomTextColorAndSize extends StatelessWidget {
  const CustomTextColorAndSize({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "Color",
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        SizedBox(width: 175,),
        Text(
          "Size",
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ],
    );
  }
}
