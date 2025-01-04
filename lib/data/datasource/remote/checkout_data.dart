import 'package:ecommerce/linkapi.dart';
import '../../../core/class/crud.dart';
import '../../../core/class/statusrequest.dart';

class CheckoutData {
  Crud crud;
  CheckoutData(this.crud);

  checkout(Map data) async {
    var response = await crud.postData(AppLink.checkOut, data);
    return response.fold(
          (l) => StatusRequest.serverFailure,
          (r) => r,
    );
  }
}
