import 'package:ecommerce/controller/orders/orders_cancel_controller.dart';
import 'package:ecommerce/data/datasource/remote/orders/details_data.dart';
import 'package:ecommerce/data/model/cartmodel.dart';
import 'package:ecommerce/data/model/ordersmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/class/statusrequest.dart';
import '../../core/constant/routes.dart';
import '../../core/functions/handlingdata_controller.dart';
import 'order_pending_controller.dart';

class OrdersDetailsController extends GetxController{
  late OrdersModel ordersModel;
  late String orderStatus;
  OrdersDetailsData ordersDetailsData = OrdersDetailsData(Get.find());

  List<CartModel> data = [];

  late StatusRequest statusRequest;

  getData() async {

    statusRequest = StatusRequest.loading;
    var response = await ordersDetailsData.getData(ordersModel.ordersId!.toString());

    print("=============================== Controller $response ");

    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest){

      // Start backend
      if (response['status'] == "success") {
        List listData = response['data'];
        data.addAll(listData.map((e) => CartModel.fromJson(e)));

      }else{

        statusRequest = StatusRequest.failure ;

      }
      // End
    }
    update();
  }

  cancelOrder() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await ordersDetailsData.cancelOrder(ordersModel.ordersId!.toString());
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        Get.snackbar("Success", "Order is cancelled");
        Future.delayed(const Duration(milliseconds: 500), () {
          OrdersPendingController ordersPendingController = Get.find<OrdersPendingController>();
          ordersPendingController.getOrders(); // تحديث الطلبات المعلقة

          // العودة للصفحة الرئيسية أو الصفحة التي تحتوي على الطلبات المعلقة
          Get.offNamed(AppRoute.home, arguments: {"currentPage" : 2});
        });
      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
    update();
  }

  deleteOrder() async {
    data.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await ordersDetailsData.deleteData(ordersModel.ordersId!.toString());
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        Get.snackbar("176".tr, "");
        Future.delayed(const Duration(milliseconds: 500), () {
          OrdersCancelController controller = Get.find<OrdersCancelController>();
          controller.getOrders(); // تحديث الطلبات المعلقة
          Get.offNamed(AppRoute.home, arguments: {"currentPage" : 2});
        });
      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
    update();
  }

  submitOrder(String orderId, double rating, String comment) async {
    data.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await ordersDetailsData.rateOrder(orderId, rating.toString(), comment);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        Get.snackbar("176".tr, "184".tr);
        Future.delayed(const Duration(milliseconds: 500), () {
          OrdersCancelController controller = Get.find<OrdersCancelController>();
          controller.getOrders(); // تحديث الطلبات المعلقة

          // العودة للصفحة الرئيسية أو الصفحة التي تحتوي على الطلبات المعلقة
          Get.offNamed(AppRoute.home, arguments: {"currentPage" : 2});
        });
      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
    update();
  }


  @override
  void onInit() {
    ordersModel = Get.arguments['ordersModel'];
    orderStatus = Get.arguments['ordersStatus'];
    getData();
    super.onInit();
  }
}