import 'dart:ui';

import 'package:ecommerce/controller/cart_controller.dart';
import 'package:ecommerce/data/model/Itemsreviewmodel.dart';
import 'package:ecommerce/data/model/itemsmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/class/statusrequest.dart';
import '../core/constant/routes.dart';
import '../core/functions/handlingdata_controller.dart';
import '../core/services/services.dart';
import '../data/datasource/remote/cart_data.dart';
import '../data/datasource/remote/itemsData.dart';
import '../view/widget/productdetails/custom_alert_product.dart';
import 'items_controller.dart';

abstract class ProductDetailsController extends GetxController{
  toggleDescription();
}

class ProductDetailsControllerImp extends ProductDetailsController{
  late ItemsModel itemsModel;
  MyServices myServices = Get.find();
  String? lang;
  StatusRequest statusRequest = StatusRequest.none;
  CartData cartData = CartData(Get.find());
  ItemsData itemsData = ItemsData(Get.find());

  late ItemsControllerImp itemsController; // إضافة controller الخاص بـ Items


  // CartController cartController = Get.put(CartController());

  List<Color> colors = [Colors.pink[100]!, Colors.black, Colors.grey[400]!];
  List<String> sizes = ["S", "M", "L"];
  Color? selectedColor;
  String? selectedSize;

  bool isDescriptionExpanded = false;
  bool isReviewExpanded = false;


  void selectColor(Color color) {
    selectedColor = color;
    update();
  }

  void selectSize(String size) {
    selectedSize = size;
    update();
  }

  addProduct(int itemsId) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await cartData.addCart(myServices.sharedPreferences.getString("id")!, itemsId);
    print("============ Add Product Response: $response");
    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest && response['status'] == "success") {


      Get.dialog(
        CustomAlertProduct(
          title: "170".tr,
          text1: "169".tr,
          text2: "104".tr,
          onPressed1: () {
            Get.offNamed(AppRoute.cart);
          },
          onPressed2: () {
            Get.back();
          },
        ),
      );
    } else {
      statusRequest = StatusRequest.failure;
    }
    update();
  }

  Map<String, dynamic> getReviews() {
    var ratingData = itemsController.ratings[itemsModel.itemsId] ?? {};
    double averageRating = ratingData['average'] ?? 0.0;
    int reviewCount = ratingData['count'] ?? 0;
    return {'averageRating': averageRating, 'reviewCount': reviewCount};
  }

  List<ItemReviews> reviewsList = [];

  getReviewsFromServer(String itemId) async {
    var response = await itemsData.viewReview(itemId);
    print("============ Add Product Response: $response");
    if (response['status'] == "success") {
      reviewsList = response['data'].map<ItemReviews>((e) => ItemReviews.fromJson(e)).toList();
    } else {
      reviewsList = [];
    }
    update();
  }

  addRating(String itemId, double rating, String comment) async {
    var response = await itemsData.addReview(myServices.sharedPreferences.getString("id")!, itemId, rating.toString(), comment );
    print("================= ADD Review $response");
    if(StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        itemsController.goToPageProduct(itemsModel);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  initialData(){
    lang = myServices.sharedPreferences.getString("lang");
    itemsModel = Get.arguments['itemsmodel'];
    itemsController = Get.find<ItemsControllerImp>();
  }
  @override
  void onInit() {
    initialData();
    super.onInit();
  }

  @override
  toggleDescription() {
    isDescriptionExpanded = !isDescriptionExpanded;
    update();
  }

  toggleReview() {
    isReviewExpanded = !isReviewExpanded;
    getReviewsFromServer(itemsModel.itemsId.toString());
    update();
  }
}