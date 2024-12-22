import 'package:ecommerce/linkapi.dart';
import '../../../core/class/crud.dart';

class SearchData {
  Crud crud;
  SearchData(this.crud);

  searchData(String search) async {
    var response = await crud.postData(AppLink.search, {
      "search" : search
    });
    return response.fold((l) => l, (r) => r);
  }
}
