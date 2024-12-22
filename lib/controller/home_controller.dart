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
  showAllItems(String categoryId);
  changeCat(int val);
}

class HomeControllerImp extends HomeController {
  MyServices myServices = Get.find();
  StatusRequest statusRequest = StatusRequest.none;
  HomeData homeData = HomeData(Get.find());
  ItemsData itemsData = ItemsData(Get.find());

  List categories = [];
  List items = [];
  Map<String, List> categoryItems = {}; // خريطة لتخزين العناصر لكل فئة

  String? name;
  String? email;
  late PageController pageController;
  int currentIndex = 0;
  String? lang;

  int selectedCat = 0;

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
    var response = await homeData.getDataa();  // يتم استرجاع البيانات الخاصة بالفئات والعناصر
    debugPrint("Response: $response");
    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        categories = response['categories'];  // تخزين الفئات في قائمة categories

        // إنشاء خريطة تحتوي على items لكل categoryId
        if (response['items'] != null) {
          for (var category in categories) {
            // التأكد من استخدام الحقل الصحيح "items_category"
            categoryItems[category['categories_id'].toString()] = response['items']
                .where((item) => item['items_category'] == category['categories_id']) // هنا يتم التصفية باستخدام "items_category"
                .toList();  // ربط كل category بـ items الخاصة بها
          }
        }
        // اختيار أول فئة كافتراضي
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
    var response = await homeData.getDataa(categoryId: categoryId);  // استخدام categoryId هنا
    debugPrint("Response for categoryId $categoryId: $response");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        items = response['items'] ?? [];  // تخزين العناصر الخاصة بالفئة المحددة
        print("Items for category $categoryId: $items");
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }


  @override
  changeCat(int val) async {
    selectedCat = val;
    String categoryId = categories[val]['categories_id'].toString();
    if (categoryItems.containsKey(categoryId)) {
      // إذا كانت العناصر موجودة في الخريطة
      items = categoryItems[categoryId] ?? [];
    } else {
      // إذا لم تكن موجودة، استرجاع العناصر من الخادم
      await getItems(categoryId);
    }
    update();
  }

  @override
  showAllItems(String categoryId) async {
    var response = await homeData.getDataa(categoryId: categoryId);
    if (response['status'] == "success") {
      List subCategories = response['subcategories'] ?? [];
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