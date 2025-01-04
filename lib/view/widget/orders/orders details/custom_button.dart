import 'package:flutter/material.dart';

import '../../../../core/constant/color.dart';
class CustomButton extends StatelessWidget {
  final String title;
  final Color color;
  final Color textColor;
  final void Function()? onPressed;
  const CustomButton({super.key, this.onPressed, required this.title, required this.color, required this.textColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: double.infinity,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(25),
        border: Border.all(width: 1, color: AppColor.black),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2), // لون الظل
            spreadRadius: 2,
            blurRadius: 5,
          ),
        ],
      ),
      child: MaterialButton(
        onPressed: onPressed,
        child: Text(
          title,
          style: Theme.of(context).textTheme.bodySmall!.copyWith(fontWeight: FontWeight.w900, color: textColor),
        ),
      ),
    );
  }
}
