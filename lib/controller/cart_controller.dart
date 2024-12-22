import 'dart:convert';

import 'package:ecommerce/core/class/statusrequest.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/core/constant/routes.dart';
import 'package:ecommerce/core/functions/handlingdata_controller.dart';
import 'package:ecommerce/core/services/services.dart';
import 'package:ecommerce/data/datasource/remote/cart_data.dart';
import 'package:ecommerce/data/model/cartmodel.dart';
import 'package:ecommerce/view/widget/productdetails/custom_alert_product.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path/path.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../data/model/itemsmodel.dart';

class CartController extends GetxController {
  CartData cartData = CartData(Get.find());
  late ItemsModel itemsModel;
  late StatusRequest statusRequest;

  TextEditingController? controllerCoupon;

  // int countItems = 1;
  List<CartModel> data = [];
  double priceOrders = 0.0;
  int totalCountItems = 1;

  MyServices myServices = Get.find();

  deleteProduct(int itemsId) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await cartData.removeCart(myServices.sharedPreferences.getString("id")!, itemsId);
    print("============ Delete Product Response: $response");
    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest && response['status'] == "success") {
      Get.rawSnackbar(
        title: "Notification",
        messageText: Text("The product has been removed from the cart.", style: Theme.of(Get.context!).textTheme.bodyMedium!.copyWith(color: AppColor.white, fontSize: 15),),
      );
      await view(); // تحديث السلة بعد الحذف
      // حفظ السلة بعد التحديث
      // saveCartData(data);
    } else {
      statusRequest = StatusRequest.failure;
    }
    update();
  }


  add(int itemsId) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await cartData.addCart(myServices.sharedPreferences.getString("id")!, itemsId);
    print("============ Add Product Response: $response");
    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest && response['status'] == "success") {
      await view();
      // saveCartData(data);

      Get.rawSnackbar(
        title: "Notification",
        messageText: Text("The product has been added from the cart.", style: Theme.of(Get.context!).textTheme.bodyMedium!.copyWith(color: AppColor.white, fontSize: 15),),
      );
    } else {
      statusRequest = StatusRequest.failure;
    }
    update();
  }

  view() async {
    statusRequest = StatusRequest.loading;
    update();

    var response = await cartData.viewCart(myServices.sharedPreferences.getString("id")!);
    print("============ View Cart Response: $response");
    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest && response['status'] == "success") {
      data.clear();
      data.addAll(response['datacart'].map<CartModel>((e) => CartModel.fromJson(e)).toList());

      final countPriceData = response['countprice'];
      totalCountItems = int.parse(countPriceData['totalcount'].toString());
      priceOrders = double.tryParse(countPriceData['totalprice'].toString()) ?? 0.0;

      // حفظ السلة بعد التحديث
      // saveCartData(data);
    } else {
      statusRequest = StatusRequest.failure;
    }
    update();
  }

  resetVarCart(){
    // totalCountItems = 0;
    priceOrders = 0.0;
  }

  refreshPage(){
    resetVarCart();
    view();
  }

  checkCoupon() async{
    statusRequest = StatusRequest.loading;
    update();
    var response = await cartData.checkCoupon(controllerCoupon!.text);
    print("============ Delete Product Response: $response");
    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest && response['status'] == "success") {
    } else {
      statusRequest = StatusRequest.failure;
    }
    update();
  }

  @override
  void onInit() {
    super.onInit();
    // initialData();
    controllerCoupon = TextEditingController();
    view();
  }

  backToHome(){
    Get.offNamed(AppRoute.home);
  }
}

// getCountItems(int itemsid) async {
//   statusRequest = StatusRequest.loading;
//   var response = await cartData.getCountCart(
//       myServices.sharedPreferences.getString("id")!, itemsid);
//   print("=============================== Controller $response ");
//   statusRequest = handlingData(response);
//   if (StatusRequest.success == statusRequest) {
//     // Start backend
//     if (response['status'] == "success") {
//       int countitems = 0;
//       countitems = int.parse(response['data']);
//       print("==================================");
//       print("$countitems");
//       return countitems;
//       // data.addAll(response['data']);
//     } else {
//       statusRequest = StatusRequest.failure;
//     }
//     // End
//   }
// }
  // Future<void> initialData() async {
  //   statusRequest = StatusRequest.loading;
  //   update();
  //
  //   if (Get.arguments != null && Get.arguments.containsKey('itemsmodel')) {
  //     itemsModel = Get.arguments['itemsmodel'];
  //     countItems = await getCountItems(itemsModel.itemsId!);
  //     statusRequest = StatusRequest.success;
  //   } else {
  //     print("Error: Missing 'itemsmodel' argument in navigation.");
  //     statusRequest = StatusRequest.failure;
  //   }
  //   update();
  // }




// saveCartData(List<CartModel> cartItems) async {
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   List<String> cartList = cartItems.map((item) => item.toJson().toString()).toList();
//   prefs.setStringList('cart_items', cartList);
// }
//
// // وظيفة لاسترجاع بيانات السلة من SharedPreferences
// Future<List<CartModel>> loadCartData() async {
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   List<String> cartList = prefs.getStringList('cart_items') ?? [];
//   return cartList.map((item) => CartModel.fromJson(jsonDecode(item))).toList();
// }

// addProduct(int itemsId) async {
//   statusRequest = StatusRequest.loading;
//   update();
//   var response = await cartData.addCart(myServices.sharedPreferences.getString("id")!, itemsId);
//   print("============ Add Product Response: $response");
//   statusRequest = handlingData(response);
//
//   if (StatusRequest.success == statusRequest && response['status'] == "success") {
//     await view(); // تحديث السلة بعد الإضافة
//     // حفظ السلة بعد التحديث
//     saveCartData(data);
//
//     Get.dialog(
//       CustomAlertProduct(
//         title: "Successfully Completed",
//         text1: "Go To Cart",
//         text2: "Continue Shopping",
//         onPressed1: () {
//           Get.offNamed(AppRoute.cart);
//         },
//         onPressed2: () {
//           Get.back();
//         },
//       ),
//     );
//   } else {
//     statusRequest = StatusRequest.failure;
//   }
//   update();
// }