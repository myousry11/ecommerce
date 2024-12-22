import 'package:ecommerce/core/class/statusrequest.dart';
import 'package:ecommerce/core/functions/handlingdata_controller.dart';
import 'package:ecommerce/core/services/services.dart';
import 'package:ecommerce/data/datasource/remote/homedata.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/constant/routes.dart';
import '../data/datasource/remote/itemsData.dart';

abstract class HomeController extends GetxController {
  initialData();
  getData();
  showAllItems(String categoryId, List subCategory);
  changeCat(int val);
}

class HomeControllerImp extends HomeController {
  MyServices myServices = Get.find();
  StatusRequest statusRequest = StatusRequest.none;
  HomeData homeData = HomeData(Get.find());
  ItemsData itemsData = ItemsData(Get.find());

  List categories = [];
  List subcategories = [];
  Map<String, List> categoryItems = {}; // خريطة لتخزين العناصر لكل فئة

  String? name;
  String? email;
  late PageController pageController;
  int currentIndex = 0;
  String? lang;

  @override
  initialData() {
    lang = myServices.sharedPreferences.getString("lang");
    name = myServices.sharedPreferences.getString("name") ?? "Guest";
    email = myServices.sharedPreferences.getString("email") ?? "guest@example.com";
    selectedCat = myServices.sharedPreferences.getInt('selectedCat') ?? 0;
  }

  @override
  void onInit() {
    pageController = PageController();
    getData();
    initialData();
    super.onInit();
  }

  void onPageChanged(int index) {
    currentIndex = index;
    update();
  }

  @override
  getData() async {
    statusRequest = StatusRequest.loading;
    var response = await homeData.getDataa();
    debugPrint("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        categories.addAll(response['categories'] ?? []);
        subcategories.addAll(response['subcategories'] ?? []);
        await getItems(categories[selectedCat]['categories_id'].toString());
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  int selectedCat = 0;

  @override
  changeCat(int val) async {
    selectedCat = val;
    if (!categoryItems.containsKey(categories[val]['categories_id'].toString())) {
      await getItems(categories[val]['categories_id'].toString());
    }
    update();
  }

  Future<void> getItems(String categoryId) async {
    if (categoryItems.containsKey(categoryId)) return; // إذا كانت البيانات موجودة بالفعل فلا نحتاج لتحميلها مرة أخرى
    statusRequest = StatusRequest.loading;
    var response = await homeData.getDataa(categoryId: categoryId);
    debugPrint("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        categoryItems[categoryId] = response['items']; // تخزين البيانات لكل فئة
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  showAllItems(categoryId, subCategory) async {
    var response = await homeData.getDataa();
    if (response['status'] == "success") {
      List subCategories = response['subcategories'];
      Get.toNamed(
        AppRoute.items,
        arguments: {
          "catid": categoryId,
          "subCategory": subCategories,
          // "items" : items,
        },
      );
    }
  }
  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
}