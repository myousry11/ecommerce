import 'package:ecommerce/view/widget/home/custom_card_newcollection.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/controller/home_controller.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/view/widget/home/custom_card_ads.dart';
import 'package:ecommerce/view/widget/home/custom_categories.dart';
import 'package:ecommerce/view/widget/home/list_items_home.dart';
import '../widget/custom_appbar_home.dart';
import '../widget/home/drawer/custom_drawer.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    // تعريف GlobalKey لربط Scaffold
    // final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      backgroundColor: AppColor.white,
      // key: scaffoldKey, // ربط الـ Scaffold بالـ GlobalKey
      // drawer: CustomDrawer(),
      body: ListView(
        children: [
          // CustomAppBar مع onMenuTap لفتح Drawer
          // CustomAppBar(
          //   title: "GemStore",
          //   onMenuTap: () {
          //     scaffoldKey.currentState?.openDrawer(); // فتح الـ Drawer باستخدام GlobalKey
          //   },
          //   onNotificationTap: () {
          //     print("Notification clicked");
          //   },
          // ),
          GetBuilder<HomeControllerImp>(builder: (controller) => Column(
            children: [
              const CustomCategoriesListHome(),
              const SizedBox(height: 20),
              const CustomCardAds(),
              const SizedBox(height: 25),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "55".tr,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    TextButton(
                      isSemanticButton: false,
                      onPressed: () {
                        String categoryId = controller
                            .categories[controller.selectedCat]['categories_id']
                            .toString();
                        controller.showAllItems(categoryId);
                      },
                      child: Text(
                        "56".tr,
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: AppColor.grey,
                          fontSize: 15,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),),
          const ListItemsHome(),
          SizedBox(height: 30,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Text(
              "57".tr,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
          SizedBox(height: 10,),
          const ListItemsHome(isTopSelling: true,),
          const SizedBox(height: 10),
          const CustomCardNewCollection(),
        ],
      ),
    );
  }
}
