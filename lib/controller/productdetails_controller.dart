import 'dart:ui';

import 'package:ecommerce/controller/cart_controller.dart';
import 'package:ecommerce/data/model/itemsmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/class/statusrequest.dart';
import '../core/constant/routes.dart';
import '../core/functions/handlingdata_controller.dart';
import '../core/services/services.dart';
import '../data/datasource/remote/cart_data.dart';
import '../view/widget/productdetails/custom_alert_product.dart';

abstract class ProductDetailsController extends GetxController{
  toggleDescription();
}

class ProductDetailsControllerImp extends ProductDetailsController{
  late ItemsModel itemsModel;
  MyServices myServices = Get.find();
  String? lang;
  late StatusRequest statusRequest;
  CartData cartData = CartData(Get.find());



  // CartController cartController = Get.put(CartController());

  List<Color> colors = [Colors.pink[100]!, Colors.black, Colors.grey[400]!];
  List<String> sizes = ["S", "M", "L"];
  Color? selectedColor;
  String? selectedSize;

  bool isDescriptionExpanded = false;


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
          title: "Successfully Completed",
          text1: "Go To Cart",
          text2: "Continue Shopping",
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

  initialData(){
    lang = myServices.sharedPreferences.getString("lang");
    itemsModel = Get.arguments['itemsmodel'];
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
}