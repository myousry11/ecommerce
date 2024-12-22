import 'package:ecommerce/view/screen/profile.dart';
import 'package:ecommerce/view/screen/search.dart';
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
    Center(child: Text("Orders", style: TextStyle(fontSize: 24))),
    const Profile()
  ];

  List bottomAppBar = [
    {"title": "Home", "icon": Image.asset("assets/icons/home.png")},
    {"title": "Search", "icon": Image.asset("assets/icons/search.png")},
    {"title": "Orders", "icon": Image.asset("assets/icons/order.png")},
    {"title": "Profile", "icon": Image.asset("assets/icons/user.png")},
  ];

  @override
  goToSettings() {
    Get.offNamed(
      AppRoute.settings,
    );
  }

  @override
  goToCart() {
    Get.toNamed(AppRoute.cart);
  }

  @override
  void onInit() {
    name = myServices.sharedPreferences.getString("name") ?? "Guest";
    email =
        myServices.sharedPreferences.getString("email") ?? "guest@example.com";
    super.onInit();
  }

  @override
  logout() {
    myServices.sharedPreferences.setString("step", "1");
    Get.offAllNamed(AppRoute.login);
  }

  @override
  void changePage(int i) {
    currentPage = i;
    update();
  }
}
