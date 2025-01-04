import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/core/constant/routes.dart';
import 'package:ecommerce/view/widget/custom_appbar_sub.dart';
import 'package:ecommerce/view/widget/productdetails/custom_line_divider.dart';
import 'package:ecommerce/view/widget/settings/custom_settings_items.dart';
import 'package:ecommerce/view/widget/settings/custom_settings_language.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
        body: ListView(
          children: [
            CustomAppbarSub(title: "64".tr, onPressed: (){
              Get.offAllNamed(AppRoute.home);
            },),
            const SizedBox(height: 10,),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 40.0),
              child: Column(
                children: [
                  CustomSettingsItems(
                      image: "assets/icons/world.png",
                      title: "75".tr,
                      function: (){
                        Get.dialog(const CustomSettingsLanguage());
                      }
                  ),
                  const SizedBox(height: 15,),
                  const CustomLineDivider(),
                  const SizedBox(height: 15,),
                  CustomSettingsItems(
                      image: "assets/icons/clipboard.png",
                      title: "76".tr,
                      function: (){
                      }
                  ),
                  const SizedBox(height: 15,),
                  const CustomLineDivider(),
                  const SizedBox(height: 15,),
                  CustomSettingsItems(
                      image: "assets/icons/policy.png",
                      title: "77".tr,
                      function: (){
                      }
                  ),
                ],
              ),
            )
          ],
        ),
    );
  }
}
