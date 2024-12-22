import 'package:flutter/material.dart';

class CustomTextTitleAuth extends StatelessWidget {
  final String title;

  const CustomTextTitleAuth({super.key, required this.title});


  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: Theme.of(context).textTheme.headlineLarge!.copyWith(
          height: 2,
          fontSize: 24,
          fontWeight: FontWeight.w900
      ),
    );
  }
}
