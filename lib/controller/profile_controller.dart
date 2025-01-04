import 'package:ecommerce/core/constant/routes.dart';
import 'package:ecommerce/core/services/services.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';

abstract class ProfileController extends GetxController{
  initialData();
  logout();
}

class ProfileControllerImp extends ProfileController{
  String? name;
  String? email;
  MyServices myServices = Get.find();


  @override
  initialData() {
    name = myServices.sharedPreferences.getString("name") ?? "Guest";
    email = myServices.sharedPreferences.getString("email") ?? "guest@example.com";
  }

  goToSettings(){
   Get.toNamed(AppRoute.settings);
  }

  goToAddress(){
    Get.toNamed(AppRoute.addressView);
  }

  @override
  logout() {
    String userId = myServices.sharedPreferences.getString("id")!;
    FirebaseMessaging.instance.unsubscribeFromTopic("users");
    FirebaseMessaging.instance.unsubscribeFromTopic("users${userId}");
    myServices.sharedPreferences.setString("step", "1");
    Get.offAllNamed(AppRoute.login);
  }


  @override
  void onInit() {
    initialData();
    super.onInit();
  }
}