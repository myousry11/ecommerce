import 'package:flutter/material.dart';

import '../../../core/constant/color.dart';
class CardReceiptTypeCheckout extends StatelessWidget {
  final String title;
  final String image;
  final bool isActive;
  final void Function()? onTap;
  const CardReceiptTypeCheckout({super.key, required this.title, required this.image, required this.isActive, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      onTap: onTap,
      child: Container(
        height: 120,
        width: 120,
        decoration: BoxDecoration(
          color: isActive == true ? AppColor.primaryColor : AppColor.secondColor,
          border: Border.all(color: AppColor.primaryColor),
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
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset(image, height: 50, width: 50, color: isActive == true ? AppColor.white : AppColor.black,),
            Text(
              title,
              style: Theme.of(context).textTheme.bodySmall!.copyWith(color: isActive == true ? AppColor.white : AppColor.black,fontSize: 15, fontWeight: FontWeight.w700),
            )
          ],
        ),
      ),
    );
  }
}
