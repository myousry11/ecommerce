import 'package:ecommerce/linkapi.dart';
import '../../../../core/class/crud.dart';
import '../../../../core/class/statusrequest.dart';

class OrdersPendingData {
  Crud crud;
  OrdersPendingData(this.crud);

  getData(String userId) async {
    var response = await crud.postData(AppLink.pendingOrders, {
      "id" : userId
    });
    return response.fold(
          (l) => StatusRequest.serverFailure,
          (r) => r,
    );
  }
}
