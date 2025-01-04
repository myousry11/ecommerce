import 'package:ecommerce/core/constant/iconassets.dart';
import 'package:ecommerce/view/widget/home/drawer/custom_toggle_theme.dart';
import 'package:ecommerce/view/widget/productdetails/custom_line_divider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/controller/home_controller.dart';

import '../../../../controller/home_screen_controller.dart';
import 'custom_list_tile.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeScreenControllerImp>(
      builder: (controller) => Drawer(
        backgroundColor: Colors.white,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              accountName: Text(
                controller.name ?? "Guest",
                style: Theme.of(context).textTheme.bodySmall,
              ),
              accountEmail: Text(
                controller.email ?? "guest@example.com",
                style: Theme.of(context).textTheme.bodySmall,
              ),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.grey.shade200,
                child: const Icon(Icons.person, color: Colors.black, size: 50),
              ),
              decoration: BoxDecoration(color: Colors.grey.shade100),
            ),
            const SizedBox(
              height: 50,
            ),
            Padding(
              padding:
              const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
              child: Column(
                children: [
                  CustomListTile(
                    image: AppIconAsset.favorite,
                    title: '63'.tr,
                    onTap: () {
                    },
                  ),
                  const CustomLineDivider(),
                  CustomListTile(
                    image: AppIconAsset.settings,
                    title: '64'.tr,
                    onTap: () {
                      controller.goToSettings();
                    },
                  ),
                  const CustomLineDivider(),
                  CustomListTile(
                    image: AppIconAsset.support,
                    title: '65'.tr,
                    onTap: () {},
                  ),
                  const CustomLineDivider(),
                  CustomListTile(
                    image: AppIconAsset.info,
                    title: '66'.tr,
                    onTap: () {},
                  ),
                  const CustomLineDivider(),
                  CustomListTile(
                    image: AppIconAsset.exit,
                    title: '67'.tr,
                    onTap: () {
                      controller.logout();
                    },
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  const CustomToggleTheme(),

                ],
              ),
            ),
          ],
        ),
      ),
    );;
  }
}



