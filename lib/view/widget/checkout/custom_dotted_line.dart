import 'package:flutter/material.dart';

class AnimatedDottedLine extends StatelessWidget {
  final bool isActive;
  final Color color;
  final double width;

  const AnimatedDottedLine({
    required this.isActive,
    required this.color,
    required this.width,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
      width: width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(
          5,
              (index) => Container(
            width: 20,
            height: 6,
            decoration: BoxDecoration(
              color: isActive ? color : color.withOpacity(0.4),
              shape: BoxShape.circle,
            ),
          ),
        ),
      ),
    );
  }
}
