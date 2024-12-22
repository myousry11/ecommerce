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
                child: Icon(Icons.person, color: Colors.black, size: 50),
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
                    image: 'assets/icons/favorite.png',
                    title: 'My Favorites',
                    onTap: () {
                    },
                  ),
                  const CustomLineDivider(),
                  CustomListTile(
                    image: 'assets/icons/settings.png',
                    title: 'Setting',
                    onTap: () {
                      controller.goToSettings();
                    },
                  ),
                  const CustomLineDivider(),
                  CustomListTile(
                    image: 'assets/icons/support.png',
                    title: 'Chat support',
                    onTap: () {},
                  ),
                  CustomLineDivider(),
                  CustomListTile(
                    image: 'assets/icons/info.png',
                    title: 'About us',
                    onTap: () {},
                  ),
                  CustomLineDivider(),
                  CustomListTile(
                    image: 'assets/icons/exit.png',
                    title: 'Log out',
                    onTap: () {
                      controller.logout();
                    },
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  CustomToggleTheme(),

                ],
              ),
            ),
          ],
        ),
      ),
    );;
  }
}



