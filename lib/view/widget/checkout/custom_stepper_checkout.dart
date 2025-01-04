import 'package:flutter/material.dart';
import 'package:ecommerce/core/constant/iconassets.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'custom_dotted_line.dart';

class CustomStepperCheckout extends StatelessWidget {
  final int currentStep;

  const CustomStepperCheckout({
    super.key,
    required this.currentStep,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(3, (index) {
        bool isActive = index < currentStep;
        bool isCurrent = index == currentStep;

        return Row(
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInOut,
              child: CircleAvatar(
                radius: 20,
                backgroundColor: isCurrent
                    ? AppColor.primaryColor
                    : isActive
                        ? AppColor.primaryColor.withOpacity(0.5)
                        : Colors.grey[300],
                child: Image.asset(
                  index == 0
                      ? AppIconAsset.location
                      : index == 1
                          ? AppIconAsset.creditCardTwo
                          : AppIconAsset.check,
                  color: isCurrent
                      ? AppColor.black
                      : isActive
                          ? AppColor.black.withOpacity(0.5)
                          : Colors.grey[400],
                  height: 25,
                ),
              ),
            ),
            if (index < 2)
              AnimatedDottedLine(
                isActive: isActive,
                color: isActive ? AppColor.primaryColor : Colors.grey[300]!,
                width: 100,
              ),
          ],
        );
      }),
    );
  }
}
