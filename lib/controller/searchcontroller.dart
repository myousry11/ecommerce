import 'package:ecommerce/core/class/statusrequest.dart';
import 'package:ecommerce/data/datasource/remote/searchData.dart';
import 'package:ecommerce/data/model/itemsmodel.dart';
import 'package:ecommerce/view/screen/search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/constant/routes.dart';
import '../core/functions/handlingdata_controller.dart';
import '../core/services/services.dart';
import '../view/screen/home.dart';

abstract class SearchController extends GetxController {
  searchItem();
  goToPageProduct(ItemsModel itemsModel);
}

class SearchControllerImp extends SearchController {

  List<ItemsModel> listData = [];

  SearchData searchData = SearchData(Get.find());

  TextEditingController? search;

  StatusRequest statusRequest = StatusRequest.none;


  bool isSearch = false;
  checkSearch(val) {
    if (val == "") {
      statusRequest = StatusRequest.none;
      isSearch = false;
    }
    update();
  }

  onSearchItems() {
    isSearch = true;
    searchItem();
    update();
  }

  @override
  searchItem() async {
    if (search!.text.isEmpty) { // تأكد أن النص ليس فارغًا
      listData.clear();
      statusRequest = StatusRequest.none;
      isSearch = false;
      update();
      return;
    }

    statusRequest = StatusRequest.loading;
    update(); // حدث الشاشة عند بدء البحث

    var response = await searchData.searchData(search!.text);
    print("=============================== Controller $response ");

    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        listData.clear();
        List responseData = response['data'];
        listData.addAll(responseData.map((e) => ItemsModel.fromJson(e)));
        isSearch = true;
      } else {
        statusRequest = StatusRequest.failure;
        isSearch = false;
      }
    }
    update();
  }
  @override
  goToPageProduct(itemsModel) {
    Get.toNamed(AppRoute.productDetails, arguments: {"itemsmodel": itemsModel});
  }


  @override
  void onInit() {
    search = TextEditingController();
    super.onInit();
  }

}
