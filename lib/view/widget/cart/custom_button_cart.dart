import 'package:flutter/material.dart';

import '../../../core/constant/color.dart';
class CustomButtonCart extends StatelessWidget {
  final String title;
  final void Function()? onPressed;
  const CustomButtonCart({super.key, required this.title, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColor.primaryColor,
        minimumSize: Size(double.infinity, 60),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40),
        ),
      ),
      child: Text(
        title,
        style: Theme.of(context).textTheme.displayMedium!.copyWith(color: AppColor.white, fontSize: 20),
      ),
    );
  }
}
