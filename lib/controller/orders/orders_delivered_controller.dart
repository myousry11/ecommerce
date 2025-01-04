import 'package:ecommerce/core/services/services.dart';
import 'package:ecommerce/data/datasource/remote/orders/delivered_data.dart';
import 'package:ecommerce/data/model/ordersmodel.dart';
import 'package:get/get.dart';
import '../../core/class/statusrequest.dart';
import '../../core/functions/handlingdata_controller.dart';

class OrdersDeliveredController extends GetxController{

  StatusRequest statusRequest = StatusRequest.none;
  OrdersDeliveredData ordersDeliveredData = OrdersDeliveredData(Get.find());
  List data = [];
  MyServices myServices = Get.find();



  String printOrderType(String val){
    if(val == "0"){
      return "136".tr;
    }else {
      return "137".tr;
    }
  }
  String printPaymentType(String val){
    if(val == "0"){
      return "138".tr;
    }else {
      return "139".tr;
    }
  }

  getOrders() async {
    data.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await ordersDeliveredData.getData(myServices.sharedPreferences.getString("id")!);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List listData = response['data'];
        data.addAll(listData.map((e) => OrdersModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    getOrders();
    super.onInit();
  }
}

//          listData.map((e) => OrdersModel.fromJson(e)).where((order) => order.ordersStatus == 0),
