import 'package:ecommerce/core/services/services.dart';
import 'package:get/get.dart';

class OrderController extends GetxController{
  // متغير لتخزين القسم المختار
  int selectedIndex = 0;
  MyServices myServices = Get.find();
  String? lang;

  // تحديث القسم المختار
  void updateSelectedIndex(int index) {
    selectedIndex = index;
    update();
  }

  @override
  void onInit() {
    lang = myServices.sharedPreferences.getString("lang");
    super.onInit();
  }
}