import 'package:flutter/material.dart';

import '../../../core/constant/color.dart';

class CardPaymentMethodCheckOut extends StatelessWidget {
  final String title;
  final String image;
  final bool isActive;
  final void Function()? onTap;
  const CardPaymentMethodCheckOut({super.key, required this.title, required this.isActive, this.onTap, required this.image});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      onTap: onTap,
      child: Container(
        width: 120,
        height: 90,
        margin: const EdgeInsets.symmetric(horizontal: 10),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
          color: isActive == true ? AppColor.primaryColor : AppColor.secondColor,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              blurRadius: 10,
              spreadRadius: 1,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              image,
              height: 40,
                color: isActive == true ? AppColor.white : AppColor.black
            ),
            Text(
              title,
              style: Theme.of(context).textTheme.bodySmall!.copyWith(color: isActive == true ? AppColor.white : AppColor.black),
            ),
          ],
        ),
      ),
    );
  }
}
