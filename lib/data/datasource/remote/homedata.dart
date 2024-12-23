import 'package:ecommerce/linkapi.dart';
import '../../../core/class/crud.dart';

class HomeData {
  Crud crud;
  HomeData(this.crud);

  getDataa() async {
    var response = await crud.postData(AppLink.home, {
    });
    return response.fold((l) => l, (r) => r);
  }
}

