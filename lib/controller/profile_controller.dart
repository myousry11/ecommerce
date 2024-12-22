import 'package:ecommerce/core/constant/routes.dart';
import 'package:ecommerce/core/services/services.dart';
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
    myServices.sharedPreferences.setString("step", "1");
    Get.offAllNamed(AppRoute.login);
  }


  @override
  void onInit() {
    initialData();
    super.onInit();
  }
}