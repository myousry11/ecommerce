import 'package:ecommerce/linkapi.dart';
import '../../../core/class/crud.dart';
import '../../../core/class/statusrequest.dart';

class ItemsData {
  Crud crud;
  ItemsData(this.crud);

  getData(String id) async {
    var response = await crud.postData(AppLink.items, {"id" : id});
    return response.fold(
          (l) => StatusRequest.serverFailure,
          (r) => r,
    );
  }

  getSubCategoryData(String id) async {
    var response = await crud.postData(AppLink.itemsFromSubCategory, {"id" : id});
    return response.fold(
          (l) => StatusRequest.serverFailure, // إعادة `StatusRequest` بدلاً من `1`
          (r) => r,
    );
  }

  getSub(String id) async {
    var response = await crud.postData(AppLink.subCat, {"id" : id.toString()});
    return response.fold(
          (l) => StatusRequest.serverFailure, // إعادة `StatusRequest` بدلاً من `1`
          (r) => r,
    );
  }
}
