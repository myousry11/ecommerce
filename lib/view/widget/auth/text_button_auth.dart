import 'package:flutter/material.dart';

import '../../../core/constant/color.dart';

class CustomTextButtonAuth extends StatelessWidget {
  final String? textWithOutClick;
  final String textWithClick;
  final void Function()? onTap;

  const CustomTextButtonAuth({super.key, this.textWithOutClick, required this.textWithClick, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          textWithOutClick!,
          style: Theme.of(context).textTheme.bodySmall!.copyWith(
            fontWeight: FontWeight.w300,
            color: AppColor.black,
          ),
        ),
        const SizedBox(
          width: 5,
        ),
        InkWell(
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
          onTap: onTap,
          child: Text(
            textWithClick,
            style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                color: AppColor.primaryColor,
                fontWeight: FontWeight.w700),
          ),
        ),

      ],
    );
  }
}
