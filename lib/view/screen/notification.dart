import 'package:ecommerce/core/class/handlingdata_view.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/core/constant/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/notification_controller.dart';
import '../../core/functions/localize_time.dart';
import '../../core/functions/translatedatabase.dart';
import '../widget/custom_appbar_sub.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: CustomAppbarSub(
          title: "73".tr,
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: GetBuilder<NotificationController>(
        builder: (controller) => ListView(
          children: [
            ...List.generate(
              controller.data.length,
                  (index) => HandlingDataView(
                statusRequest: controller.statusRequest,
                widget: Card(
                  margin: const EdgeInsets.symmetric(
                      horizontal: 20, vertical: 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 5,
                  color: AppColor.white,
                  child: Stack(
                    children: [
                      ListTile(
                        title: Text(
                          "${translateDatabase(controller.data[index]['notification_title_ar'], controller.data[index]['notification_title'])}",
                          style: Theme.of(context).textTheme.headlineLarge!.copyWith(fontWeight: FontWeight.w700),
                        ),
                        subtitle: Text(
                          "${translateDatabase(controller.data[index]['notification_body_ar'], controller.data[index]['notification_body'])}",
                          style: Theme.of(context).textTheme.bodySmall!.copyWith(color: Colors.grey, fontSize: 14),
                        ),
                      ),
                      Positioned(
                        right: controller.lang == 'en' ? 5 : null,
                        left: controller.lang == 'ar' ? 5 : null,
                        top: 10,
                        child: Text(
                          // Use the localizeTime function to format time
                          localizeTime(
                            controller.data[index]['notification_datetime'],
                          ),
                          style: Theme.of(context).textTheme.bodySmall!.copyWith(color: AppColor.primaryColor),
                        ),
                      ),
                    ],
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
