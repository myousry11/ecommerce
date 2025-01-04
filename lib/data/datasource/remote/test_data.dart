import 'package:ecommerce/linkapi.dart';
import '../../../core/class/crud.dart';
import '../../../core/class/statusrequest.dart';

class TestData {
  Crud crud;
  TestData(this.crud);

  getData() async {
    var response = await crud.postData(AppLink.test, {});
    return response.fold(
          (l) => StatusRequest.serverFailure,
          (r) => r,
    );
  }
}
