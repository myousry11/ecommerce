import 'package:ecommerce/core/services/services.dart';
import 'package:ecommerce/data/datasource/remote/notificationData.dart';
import 'package:get/get.dart';

import '../core/class/statusrequest.dart';
import '../core/functions/handlingdata_controller.dart';

class NotificationController extends GetxController{
  NotificationData notificationData = NotificationData(Get.find());

  String? lang;

  List data = [];

  late StatusRequest statusRequest;

  MyServices myServices = Get.find();

  getNotify() async {

    statusRequest = StatusRequest.loading;

    var response = await notificationData.getData(myServices.sharedPreferences.getString("id")!);

    print("=============================== Controller $response ");

    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest){

      // Start backend
      if (response['status'] == "success") {

        data.addAll(response['data']);


      }else{

        statusRequest = StatusRequest.failure ;

      }
      // End
    }
    update();
  }

  @override
  void onInit() {
    lang = myServices.sharedPreferences.getString("lang");
    getNotify();
    super.onInit();
  }
}