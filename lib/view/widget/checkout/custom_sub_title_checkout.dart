import 'package:flutter/material.dart';

class CustomSubTitleCheckout extends StatelessWidget {
  final String title;
  const CustomSubTitleCheckout({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: Theme.of(context)
          .textTheme
          .bodyLarge!
          .copyWith(fontWeight: FontWeight.w700, fontSize: 25),
    );
  }
}
