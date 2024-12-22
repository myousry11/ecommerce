import 'package:flutter/material.dart';
class CustomLineDivider extends StatelessWidget {
  const CustomLineDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Divider(color: Colors.grey.withOpacity(0.2), thickness: 2 ),
    );
  }
}
