import 'package:ecommerce/controller/profile_controller.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/view/widget/profile/custom_profile_details.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../core/constant/iconassets.dart';
import '../widget/productdetails/custom_line_divider.dart';
import '../widget/profile/custom_profile_items.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      body: GetBuilder<ProfileControllerImp>(
        builder: (controller) => ListView(
          children: [
            CustomProfileDetails(
                onPressed: (){
                  controller.goToSettings();
                },
                name: controller.name ?? "Guest",
                email: controller.email ?? "guest@example.com"
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1), // لون الظل خفيف
                    spreadRadius: 1,
                    blurRadius: 6,
                    offset: const Offset(0, 4), // موقع الظل
                  ),
                ],
                borderRadius: BorderRadius.circular(40), // تعديل الحواف ليكون أكثر دائرية
              ),
              child: Card(
                color: AppColor.white,
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                  child: Column(
                    children: [
                      CustomProfileItems(
                        image: AppIconAsset.location,
                        title: "78".tr,
                        function: () {
                          controller.goToAddress();
                        },
                      ),
                      const SizedBox(height: 5),
                      const CustomLineDivider(),
                      const SizedBox(height: 5),
                      CustomProfileItems(
                        image: "assets/icons/wallet.png",
                        title: "79".tr,
                        function: () {},
                      ),
                      const SizedBox(height: 5),
                      const CustomLineDivider(),
                      const SizedBox(height: 5),
                      CustomProfileItems(
                        image: "assets/icons/voucher.png",
                        title: "80".tr,
                        function: () {},
                      ),
                      const SizedBox(height: 5),
                      const CustomLineDivider(),
                      const SizedBox(height: 5),
                      CustomProfileItems(
                        image: "assets/icons/telephone.png",
                        title: "81".tr,
                        function: () async{
                         await launchUrl(Uri.parse("tel:+201144322061"));  // title, body, userid , table in sql
                        },
                      ),
                      const SizedBox(height: 5),
                      const CustomLineDivider(),
                      const SizedBox(height: 5),
                      CustomProfileItems(
                        image: "assets/icons/exit.png",
                        title: "67".tr,
                        function: () {
                          controller.logout();
                        },
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
