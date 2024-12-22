import 'package:ecommerce/bindings/initial_bindings.dart';
import 'package:ecommerce/controller/home_screen_controller.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/view/widget/home/custom_bottomappbar_home.dart';
import 'package:ecommerce/view/widget/home/custom_button_appbar.dart';
import 'package:ecommerce/view/widget/home/drawer/custom_drawer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/home_controller.dart';
import '../widget/custom_appbar_home.dart';

class HomeScreen extends GetView<AppBindings> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    return GetBuilder<HomeScreenControllerImp>(
      builder: (controller) => Scaffold(
        backgroundColor: AppColor.white,
        key: scaffoldKey, // ربط الـ Scaffold بالـ GlobalKey
        resizeToAvoidBottomInset: false,
        floatingActionButton: FloatingActionButton(

          onPressed: () {
            controller.goToCart();
          },
          shape: const CircleBorder(),
          child: Image.asset("assets/icons/cart.png", height: 30,),
        ),
         floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        drawer: CustomDrawer(),
        appBar: CustomAppBar(
          title: "GemStore",
          leadingTab: () {
            scaffoldKey.currentState?.openDrawer(); // فتح الـ Drawer باستخدام GlobalKey
          },
          actionTab: () {
            print("Notification clicked");
          },
        ),
        body: controller.listPage.elementAt(controller.currentPage),

        bottomNavigationBar: const CustomBottomAppBarHome(),
      ),
    );
  }
}
