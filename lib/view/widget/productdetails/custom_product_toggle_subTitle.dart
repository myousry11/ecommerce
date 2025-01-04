import 'package:ecommerce/controller/productdetails_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class CustomProductToggleSubtitle extends StatelessWidget {
  final String title;
  final String content;
  final void Function()? onTap;
  const CustomProductToggleSubtitle({super.key, required this.title, required this.content,this.onTap});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductDetailsControllerImp>(builder: (controller) => Column(
      children: [
        ListTile(
          title:  Text(title, style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 22),),
          trailing: AnimatedSwitcher(
            duration: const Duration(milliseconds: 300), // مدة تغيير الأيقونة
            transitionBuilder: (Widget child, Animation<double> animation) {
              return ScaleTransition(
                scale: animation, // إضافة تأثير أثناء التغيير
                child: child,
              );
            },
            child: controller.isDescriptionExpanded
                ? Image.asset(
              "assets/icons/downarrow.png",
              key: const ValueKey("down"), // مفتاح فريد لتغيير الأيقونة
              height: 25,
              width: 25,
            )
                : Image.asset(
              "assets/icons/arrowforward.png",
              key: const ValueKey("forward"), // مفتاح فريد لتغيير الأيقونة
              height: 25,
              width: 25,
            ),
          ),
          onTap: onTap,
        ),
        AnimatedSize(
          duration: const Duration(milliseconds: 300), // مدة الحركة
          curve: Curves.easeInOut,
          child: controller.isDescriptionExpanded
              ?  Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: 10, vertical: 5),
            child: Text(
                content,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 15, color: Colors.grey.withOpacity(0.6))),
          )
              : const SizedBox.shrink(),
        )
      ],
    ));
  }
}
