import 'package:ecommerce/linkapi.dart';

import '../../../../core/class/crud.dart';
import '../../../../core/class/statusrequest.dart';


class OrdersDetailsData{
  Crud crud;
  OrdersDetailsData(this.crud);

  getData(String id) async {
    var response = await crud.postData(AppLink.ordersDetails, {
      "id" : id
    });
    return response.fold(
          (l) => StatusRequest.serverFailure,
          (r) => r,
    );
  }

  cancelOrder(String orderId) async{
    var response = await crud.postData(AppLink.cancelPressOrders, {
      "ordersid" : orderId
    });
    return response.fold(
          (l) => StatusRequest.serverFailure,
          (r) => r,
    );
  }

  deleteData(String orderId) async {
    var response = await crud.postData(AppLink.deleteOrders, {"id": orderId});
    return response.fold((l) => l, (r) => r);
  }

  rateOrder(String orderId, String rate, String comment) async{
    var response = await crud.postData(AppLink.rateOrder, {
      "id" : orderId,
      "rating" : rate,
      "comment" : comment,
    });
    return response.fold(
          (l) => StatusRequest.serverFailure,
          (r) => r,
    );
  }
}
