import 'package:flutter/material.dart';

import '../../core/constant/color.dart';

class CustomAppbarSub extends StatelessWidget {
  final String title;
  final void Function()? onPressed;

  const CustomAppbarSub({super.key, required this.title, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20.0),
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              height: 35,
              decoration: BoxDecoration(
                color: Colors.white, // لون الخلفية
                shape: BoxShape.circle, // تحديد الشكل كدائرة
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2), // لون الظل
                    spreadRadius: 2,
                    blurRadius: 5,
                  ),
                ],
              ),
              child: IconButton(
                highlightColor: AppColor.grey.withOpacity(0.3),
                icon: const Icon(
                  Icons.arrow_back_ios_new_outlined,
                  size: 18,
                ),
                onPressed: onPressed,
              ),
            ),
            Text(
              title,
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .copyWith(fontSize: 20),
            ),
            const SizedBox(width: 48), // مساحة لضمان التوازن إذا لم يكن هناك عنصر آخر.
          ],
        ),
      ),
    );
  }
}
