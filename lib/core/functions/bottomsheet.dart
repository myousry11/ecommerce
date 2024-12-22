import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart'; // استيراد حزمة Lottie
import 'package:get/get.dart';
import '../../view/widget/auth/custom_success_bottomsheet.dart';
import '../constant/routes.dart';

void showCustomBottomSheet({
  required BuildContext context,
  required void Function()? onPressed,
  String? imageAsset,
  String? lottieAsset,
  required String title,
  required String textBody,
  required String textButton,
}) {
  Widget animationWidget = lottieAsset != null
      ? Lottie.asset(lottieAsset, fit: BoxFit.contain,
    width: 170,
    height: 120,)
      : (imageAsset != null
      ? Image.asset(imageAsset, fit: BoxFit.contain,
    width: 170,
    height: 120,)
      : SizedBox());

  showModalBottomSheet(
    context: context,
    builder: (_) => BottomSheetContent(
      image: animationWidget,
      title: title,
      textBody: textBody,
      onPressed: onPressed,
      textButton: textButton,
    ),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(70),
        topRight: Radius.circular(70),
      ),
    ),
    isDismissible: false,
    enableDrag: false,
  );
}
