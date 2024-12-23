import 'package:ecommerce/core/constant/routes.dart';
import 'package:ecommerce/data/datasource/remote/itemsData.dart';
import 'package:ecommerce/data/model/itemsmodel.dart';
import 'package:ecommerce/data/model/subcategoriesmodel.dart';
import 'package:get/get.dart';

import '../core/class/statusrequest.dart';
import '../core/functions/handlingdata_controller.dart';

abstract class ItemsController extends GetxController {
  initialData();
  getItems(String subCategoryId);
  goToPageProduct(ItemsModel itemsModel);
}

class ItemsControllerImp extends ItemsController {
  List categories = [];
  List<SubCategoriesModel> subCategories = [];
  List items = [];
  int? selectedCatSub;
  String? catId;
  StatusRequest statusRequest = StatusRequest.none;
  ItemsData itemsData = ItemsData(Get.find());
  List data = [];

  int? select;

  @override
  void onInit() {
    super.onInit();
    initialData();
  }

  @override
  initialData() {
    // تحقق من وجود البيانات في Get.arguments


    catId = Get.arguments!['catid'];
    print("cat id ======== ${catId}");
    subCategories = (Get.arguments!['subCategory'] as List<dynamic>)
        .map(
          (e) => SubCategoriesModel.fromJson(e as Map<String, dynamic>),
    )
        .toList();
    selectedCatSub = subCategories.isNotEmpty ? subCategories.first.subCategoriesId : null;


    if (selectedCatSub != null) {
      getItems(selectedCatSub!.toString());
    } else {
      print('Error: selectedCat is null');
    }
  }

  void changeSubCategory(int index, String subCategoryId) {
    selectedCatSub = subCategories[index].subCategoriesId;
    getItems(selectedCatSub.toString());
    update();
  }

  @override
  getItems(subCategoryId) async {
    data.clear();
    statusRequest = StatusRequest.loading;
    var response = await itemsData.getSubCategoryData(subCategoryId);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        // جلب العناصر المرتبطة بالفئة الفرعية
        data.addAll(response['data'] ?? []);
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

  @override
  void dispose() {
    data.clear();
    super.dispose();
  }
}
