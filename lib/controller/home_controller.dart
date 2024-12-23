import 'dart:math';
import 'package:ecommerce/core/class/statusrequest.dart';
import 'package:ecommerce/core/functions/handlingdata_controller.dart';
import 'package:ecommerce/core/services/services.dart';
import 'package:ecommerce/data/datasource/remote/homedata.dart';
import 'package:ecommerce/data/model/itemsmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/constant/routes.dart';
import '../data/datasource/remote/itemsData.dart';

abstract class HomeController extends GetxController {
  initialData();
  getData();
  showAllItems(String categoryId);
  changeCat(int val);
  goToPageProduct(ItemsModel itemsModel);
}

class HomeControllerImp extends HomeController {
  MyServices myServices = Get.find();
  StatusRequest statusRequest = StatusRequest.none;
  HomeData homeData = HomeData(Get.find());
  ItemsData itemsData = ItemsData(Get.find());

  List categories = [];
  List subCategories = [];
  List items = [];
  Map<String, List> categoryItems = {}; // خريطة لتخزين العناصر لكل فئة

  String? name;
  String? email;
  late PageController pageController;
  int currentIndex = 0;
  String? lang;

  int selectedCat = 1;

  @override
  initialData() {
    lang = myServices.sharedPreferences.getString("lang");
    name = myServices.sharedPreferences.getString("name") ?? "Guest";
    email = myServices.sharedPreferences.getString("email") ?? "guest@example.com";
    selectedCat = (categories.isNotEmpty) ? 0 : 1;
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
    var response = await homeData.getDataa(); // يتم استرجاع البيانات الخاصة بالفئات والعناصر
    debugPrint("Response: $response");
    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        categories = response['categories'] ?? [];
        subCategories = response['subcategories'] ?? [];

        if (response['items'] != null) {
          // ربط العناصر بالفئات الفرعية
          for (var category in categories) {
            categoryItems[category['categories_id'].toString()] = response['items']
                .where((item) => item['items_category'] == category['categories_id'])
                .toList();
          }
        }

        if (categories.isNotEmpty) {
          selectedCat = 0;
          await getItems(categories[selectedCat]['categories_id'].toString());
        }
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  getItems(String categoryId) async {
    statusRequest = StatusRequest.loading;
    var response = await homeData.getDataa();
    debugPrint("Response for categoryId $categoryId: $response");

    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        // تحميل العناصر الخاصة بالفئة
        categoryItems[categoryId] = response['items'] ?? [];
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  changeCat(int val) async {
    selectedCat = val;
    if (categories.isNotEmpty) {
      String categoryId = categories[val]['categories_id'].toString();
      if (categoryItems.containsKey(categoryId)) {
        // تحميل العناصر من الخريطة إذا كانت موجودة
        items = categoryItems[categoryId] ?? [];
      } else {
        await getItems(categoryId);
      }
    }
    update();
  }

  @override
  showAllItems(categoryId) async {
    if (categoryId.isEmpty) {
      debugPrint("Error: categoryId is empty");
      return;
    }

    var response = await homeData.getDataa();
    debugPrint("Response: $response");  // طباعة الاستجابة الكاملة

    if (response['status'] == "success") {
      // تصفية الفئات الفرعية المرتبطة بالفئة فقط
      List subCategories = response['subcategories']?.where((sub) {
        // debugPrint("Checking subcategory: ${sub['subcategories_category']} for categoryId: $categoryId");
        return sub['subcategories_category'].toString() == categoryId;  // تأكد من أن النوع متطابق
      }).toList() ?? [];

      // debugPrint("Filtered Subcategories: $subCategories");  // طباعة الفئات الفرعية بعد التصفية

      // إرسال البيانات عبر Get.toNamed
      Get.toNamed(
        AppRoute.items,
        arguments: {
          "catid": categoryId,
          "subCategory": subCategories,
        },
      );
    } else {
      debugPrint("Error: Failed to fetch data.");
    }
  }




  @override
  goToPageProduct(itemsModel) {
    Get.toNamed(AppRoute.productDetails, arguments: {"itemsmodel": itemsModel});
  }

  @override
  void dispose() {
    pageController.dispose();
    categories.clear();
    super.dispose();
  }
}
