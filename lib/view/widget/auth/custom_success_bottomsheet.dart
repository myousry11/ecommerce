import 'package:ecommerce/core/constant/color.dart';
import 'package:flutter/material.dart';


class BottomSheetContent extends StatelessWidget {
  final void Function()? onPressed;
  final Widget image;
  final String title;
  final String textBody;
  final String textButton;
  const BottomSheetContent({super.key, this.onPressed, required this.image, required this.title, required this.textBody, required this.textButton});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          image,
          Text(
            title,
            style: Theme.of(context).textTheme.headlineLarge,
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 5,
          ),
          Text(textBody, textAlign: TextAlign.center,style: Theme.of(context).textTheme.bodySmall,),
          const SizedBox(height: 20),
          Container(
            height: 50,
            width: 150,
            child: MaterialButton(
              color: AppColor.primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              onPressed: onPressed,
              child: Text(
                textButton,
              style: Theme.of(context).textTheme.displayMedium,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
