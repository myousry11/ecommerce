import 'package:flutter/material.dart';

import '../../../core/constant/color.dart';
class CardShippingAddressCheckout extends StatelessWidget {
  final String title;
  final String subTitle;
  final bool isActive;
  final void Function()? onTap;
  const CardShippingAddressCheckout({super.key, required this.title, required this.subTitle, required this.isActive, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      onTap: onTap,
      child: Card(
        color: isActive == true ? AppColor.primaryColor : AppColor.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: ListTile(
          title: Text(
              title,
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: isActive == true ? AppColor.white : AppColor.black, fontWeight: FontWeight.w900),
          ),
          subtitle: Text(
              subTitle,
            style: Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: 14 ,color: isActive == true ? AppColor.white : AppColor.black, fontWeight: FontWeight.w900, height: 3),
          ),
        ),
      ),
    );
  }
}
