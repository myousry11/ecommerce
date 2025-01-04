import 'package:ecommerce/bindings/initial_bindings.dart';
import 'package:ecommerce/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/imageassets.dart';

class CustomCardNewCollection extends GetView<AppBindings> {
  const CustomCardNewCollection({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeControllerImp>(
      builder: (controller) => Container(
        padding: const EdgeInsets.all(16.0),
        child: Stack(
          children: [
            Container(
              height: 160,
              decoration: BoxDecoration(
                color: const Color(0xffF8F8FA),
                borderRadius: BorderRadius.circular(16.0),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "58".tr,
                            style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 16, color: Colors.grey, fontWeight: FontWeight.w400),
                          ),
                          SizedBox(height: 8),
                          Text(
                            "${'59'.tr} ${'60'.tr}",
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
                  color: const Color(0xffE2E2E2).withOpacity(0.3),
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
                decoration: const BoxDecoration(
                  color: Color(0xffE2E2E2),
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
                decoration:  const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(AppImageAsset.discoverAds),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
