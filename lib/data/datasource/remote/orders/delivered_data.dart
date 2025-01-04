import 'package:ecommerce/linkapi.dart';
import '../../../../core/class/crud.dart';
import '../../../../core/class/statusrequest.dart';

class OrdersDeliveredData {
  Crud crud;
  OrdersDeliveredData(this.crud);

  getData(String userId) async {
    var response = await crud.postData(AppLink.deliveredOrders, {
      "id" : userId
    });
    return response.fold(
          (l) => StatusRequest.serverFailure,
          (r) => r,
    );
  }
}
