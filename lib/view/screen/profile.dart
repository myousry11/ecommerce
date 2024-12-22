import 'package:ecommerce/controller/profile_controller.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/view/widget/profile/custom_profile_details.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1), // لون الظل خفيف
                    spreadRadius: 1,
                    blurRadius: 6,
                    offset: Offset(0, 4), // موقع الظل
                  ),
                ],
                borderRadius: BorderRadius.circular(40), // تعديل الحواف ليكون أكثر دائرية
              ),
              child: Card(
                color: AppColor.white,
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  child: Column(
                    children: [
                      CustomProfileItems(
                        image: "assets/icons/pin.png",
                        title: "Address",
                        function: () {
                          controller.goToAddress();
                        },
                      ),
                      SizedBox(height: 15),
                      CustomLineDivider(),
                      SizedBox(height: 15),
                      CustomProfileItems(
                        image: "assets/icons/wallet.png",
                        title: "Payment method",
                        function: () {},
                      ),
                      SizedBox(height: 15),
                      CustomLineDivider(),
                      SizedBox(height: 15),
                      CustomProfileItems(
                        image: "assets/icons/voucher.png",
                        title: "Voucher",
                        function: () {},
                      ),
                      SizedBox(height: 15),
                      CustomLineDivider(),
                      SizedBox(height: 15),
                      CustomProfileItems(
                        image: "assets/icons/star.png",
                        title: "Rate this app",
                        function: () {},
                      ),
                      SizedBox(height: 15),
                      CustomLineDivider(),
                      SizedBox(height: 15),
                      CustomProfileItems(
                        image: "assets/icons/exit.png",
                        title: "Log out",
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
