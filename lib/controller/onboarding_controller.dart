import 'package:ecommerce/core/services/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../core/constant/routes.dart';
import '../data/datasource/static/static.dart';

abstract class OnBoardingController extends GetxController {
  next();
  onPageChanged(int index);
  skip();
}

class OnBoardingControllerImp extends OnBoardingController {
  int currentPage = 0;
  late PageController pageController;

  @override
  next() {
    currentPage++;

  if(currentPage > onBoardingList.length - 1){
    Get.offAllNamed(AppRoute.login);
    }
    else {
      pageController.animateToPage(
        currentPage,
        duration: const Duration(milliseconds: 900),
        curve: Curves.easeInOut,
      );
    }

  }

  @override
  skip() {
    Get.offAllNamed(AppRoute.login);
  }


  @override
  onPageChanged(int index) {
    currentPage = index;
    update();
  }

  @override
  onInit(){

    pageController = PageController(viewportFraction: 0.85);
    super.onInit();
  }

}