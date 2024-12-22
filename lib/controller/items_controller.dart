import 'package:ecommerce/core/constant/routes.dart';
import 'package:ecommerce/data/datasource/remote/itemsData.dart';
import 'package:ecommerce/data/model/itemsmodel.dart';
import 'package:ecommerce/data/model/subcategoriesmodel.dart';
import 'package:get/get.dart';

import '../core/class/statusrequest.dart';
import '../core/functions/handlingdata_controller.dart';

abstract class ItemsController extends GetxController {
  initialData();
  getItems(String categoryId);
  goToPageProduct(ItemsModel itemsModel);
}

class ItemsControllerImp extends ItemsController {
  List categories = [];
  List<SubCategoriesModel> subCategories = [];
  List items = [];
  int? selectedCat;
  String? catId;
  StatusRequest statusRequest = StatusRequest.none;
  ItemsData itemsData = ItemsData(Get.find());
  List data = [];
  // String? lang;

  @override
  void onInit() {
    super.onInit();
    initialData();
  }

  @override
  initialData() {
    // تحقق من وجود البيانات في Get.arguments
    // if (Get.arguments == null || !Get.arguments!.containsKey('catid') || !Get.arguments!.containsKey('subCategory')) {
    //   print('Error: Missing required arguments');
    //   return;
    // }

    catId = Get.arguments!['catid'];
    subCategories = (Get.arguments!['subCategory'] as List<dynamic>)
        .map(
          (e) => SubCategoriesModel.fromJson(e as Map<String, dynamic>),
    )
        .toList();
    selectedCat = subCategories.isNotEmpty ? subCategories.first.subCategoriesId : null;
    // lang = Get.arguments!['lang'];

    // تحقق من أن selectedCat ليس null قبل استدعاء getItems
    if (selectedCat != null) {
      getItems(selectedCat!.toString());
    } else {
      print('Error: selectedCat is null');
    }
  }

  void changeSubCategory(int index, String subCategoryId) {
    selectedCat = subCategories[index].subCategoriesId;
    getItems(selectedCat.toString());
    update();
  }

  @override
  getItems(categoryId) async {
    data.clear();
    statusRequest = StatusRequest.loading;
    var response = await itemsData.getSubCategoryData(categoryId);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  goToPageProduct(itemsModel) {
    Get.toNamed(AppRoute.productDetails, arguments: {"itemsmodel": itemsModel});
  }
}
