import 'dart:io';

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
        key: scaffoldKey,
        resizeToAvoidBottomInset: false,
        floatingActionButton: FloatingActionButton(
          backgroundColor: AppColor.primaryColor,
          onPressed: () {
            controller.goToCart();
          },
          shape: const CircleBorder(),
          child: Image.asset("assets/icons/cart.png", height: 30,),
        ),
         floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        drawer: const CustomDrawer(),
        appBar: CustomAppBar(
          title: controller.titleAppBar[controller.currentPage],
          leadingTab: () {
            scaffoldKey.currentState?.openDrawer();
          },
          actionTab: () {
            controller.getToNotifyView();
          },
        ),
        body: WillPopScope(
            child: controller.listPage.elementAt(controller.currentPage),
            onWillPop: (){
              Get.defaultDialog(
                backgroundColor: AppColor.white,
                  title: "159".tr,
                  titleStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(color: AppColor.primaryColor),
                  middleText: "201".tr,
                  middleTextStyle: Theme.of(context).textTheme.bodySmall,
                onConfirm: (){
                    exit(0);
                },
                  buttonColor: AppColor.primaryColor,
                onCancel: (){}
              );
              return Future.value(false);
            }
        ),

        bottomNavigationBar: const CustomBottomAppBarHome(),
      ),
    );
  }
}
