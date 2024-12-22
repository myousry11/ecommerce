
import 'package:get/get.dart';

import '../core/constant/routes.dart';
import '../core/services/services.dart';

abstract class WelcomeController extends GetxController {
  goToOnBoarding();
}

class WelcomeControllerImp extends WelcomeController {
  MyServices myServices = Get.find();

  @override
  goToOnBoarding() {
    myServices.sharedPreferences.setString("step", "1");
    Get.offAllNamed(AppRoute.onBoarding);
  }
}