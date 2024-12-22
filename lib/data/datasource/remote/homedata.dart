import 'package:ecommerce/linkapi.dart';
import '../../../core/class/crud.dart';

class HomeData {
  Crud crud;
  HomeData(this.crud);

  getDataa({String? categoryId}) async {
    var response = await crud.postData(AppLink.home, {
      "id": categoryId ?? "", // إرسال category_id إذا كان متوفراً
    });
    return response.fold((l) => l, (r) => r);
  }
}

