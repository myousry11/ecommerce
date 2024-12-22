import 'package:ecommerce/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomCardNewCollection extends GetView<HomeControllerImp> {
  const CustomCardNewCollection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Stack(
        children: [
          // الـ Container الأساسي
          Container(
            height: 160,
            decoration: BoxDecoration(
              color: const Color(0xffF8F8FA),
              borderRadius: BorderRadius.circular(16.0),
            ),
            child: Row(
              children: [
                // النصوص على اليسار
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          "| NEW COLLECTION",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          "HANG OUT\n& PARTY",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 15,
            right: controller.lang == 'en' ? 5 : null,
            left: controller.lang == 'ar' ? 5 : null,
            child: Container(
              height: 130,
              width: 130,
              decoration: BoxDecoration(
                color: Color(0xffE2E2E2).withOpacity(0.3),
                shape: BoxShape.circle,
              ),
            ),
          ),
          Positioned(
            top: 30,
            right: controller.lang == "en" ? 20 : null,
            left: controller.lang == "ar" ? 20 : null,
            child: Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                color: const Color(0xffE2E2E2),
                shape: BoxShape.circle,
              ),
            ),
          ),
          Positioned(
            top: 0,
            right: controller.lang == 'en' ? 10 : null,
            left: controller.lang == 'ar' ? 10 : null,
            child: Container(
              height: 150,
              width: 120,
              decoration: BoxDecoration(
                image: const DecorationImage(
                  image: AssetImage('assets/images/delivery.png'),
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
