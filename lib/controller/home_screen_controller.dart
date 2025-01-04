import 'package:ecommerce/view/screen/orders/orders_view.dart';
import 'package:ecommerce/view/screen/profile.dart';
import 'package:ecommerce/view/screen/search.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/constant/routes.dart';
import '../core/services/services.dart';
import '../view/screen/home.dart';

abstract class HomeScreenController extends GetxController {
  void changePage(int i);
  goToSettings();
  logout();
  goToCart();
}

class HomeScreenControllerImp extends HomeScreenController {
  MyServices myServices = Get.find();
  int currentPage = 0;
  String? name;
  String? email;

  List<Widget> listPage = [
    const Home(),
    const Search(),
    Orders(),
    const Profile()
  ];

  List bottomAppBar = [
    {"title": "Home", "icon": Image.asset("assets/icons/home.png")},
    {"title": "Search", "icon": Image.asset("assets/icons/search.png")},
    {"title": "Orders", "icon": Image.asset("assets/icons/order.png")},
    {"title": "Profile", "icon": Image.asset("assets/icons/user.png")},
  ];

  List<String> titleAppBar = [
    "61".tr,
    "70".tr,
    "71".tr,
    "72".tr,
  ];


  @override
  goToSettings() {
    Get.offNamed(
      AppRoute.settings,
    );
  }

  @override
  goToCart() {
    Get.offNamed(AppRoute.cart);
  }

  getToNotifyView(){
    Get.toNamed(AppRoute.notificationView);
  }

  @override
  void onInit() {
    if (Get.arguments != null) {
      currentPage = Get.arguments['currentPage'] ?? 0; // التأكد من التوجيه إلى Orders
    }
    name = myServices.sharedPreferences.getString("name") ?? "Guest";
    email =
        myServices.sharedPreferences.getString("email") ?? "guest@example.com";
    super.onInit();
  }

  @override
  logout() {
    String userId = myServices.sharedPreferences.getString("id")!;
    FirebaseMessaging.instance.unsubscribeFromTopic("users");
    FirebaseMessaging.instance.unsubscribeFromTopic("users${userId}");
    myServices.sharedPreferences.setString("step", "1");
    Get.offAllNamed(AppRoute.login);
  }

  @override
  void changePage(int i) {
    currentPage = i;
    update();
  }
}
