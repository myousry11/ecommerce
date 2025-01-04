import 'package:flutter/material.dart';

import '../../../core/constant/color.dart';
class CustomAlertProduct extends StatelessWidget {
  final String title;
  final String text1;
  final String text2;
  final void Function()? onPressed1;
  final void Function()? onPressed2;
const CustomAlertProduct({super.key, required this.title, required this.text1, required this.text2, this.onPressed1, this.onPressed2});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppColor.white,
      title: Text(
        title ,
        style: Theme.of(context).textTheme.bodyMedium,
      ),
      content: SizedBox(
        height: 120,
        child: Column(
          children: [
            MaterialButton(
              height: 50,
              minWidth: double.infinity,
              color: Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              onPressed: onPressed1,
              child: Text(
                text1,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: AppColor.white),
              ),
            ),
            const SizedBox(height: 5,),
            MaterialButton(
              onPressed: onPressed2,
              child: Text(
                text2,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Colors.grey.withOpacity(0.6), fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );;
  }
}
