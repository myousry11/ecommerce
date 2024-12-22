import 'package:flutter/material.dart';

class CustomButtonAppbar extends StatelessWidget {
  // final String textButton;
  final Image image;
  final bool? active;
  final VoidCallback onPressed;

  const CustomButtonAppbar({
    super.key,
    // required this.textButton,
    required this.image, // Image widget is passed
    required this.active,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 30,
            height: 30,
            child: ColorFiltered(
              colorFilter: ColorFilter.mode(
                active == true ? Colors.blue : Colors.grey,
                BlendMode.srcIn, // Apply the color to the image
              ),
              child: image, // Use the image directly
            ),
          ),
          // Text(
          //   textButton,
          //   style: TextStyle(
          //     color: active == true ? Colors.blue : Colors.grey,
          //   ),
          // ),
        ],
      ),
    );
  }
}
