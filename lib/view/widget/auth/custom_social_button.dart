import 'package:flutter/material.dart';

import '../../../core/constant/color.dart';

class CustomSocialButton extends StatelessWidget {
  final void Function()? onTap;
  final String image;
  final double? height;
  const CustomSocialButton({super.key, this.onTap, required this.image, this.height});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 30,
      backgroundColor: AppColor.grey.withOpacity(0.2),
      child: InkWell(
        borderRadius: BorderRadius.circular(30),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(
            image,
            height: height,
          ),
        ),
      ),
    );
  }
}
