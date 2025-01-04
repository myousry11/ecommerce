import 'package:ecommerce/linkapi.dart';
import '../../../../core/class/crud.dart';
import '../../../../core/class/statusrequest.dart';

class OrdersCancelData {
  Crud crud;
  OrdersCancelData(this.crud);

  getData(String userId) async {
    var response = await crud.postData(AppLink.cancelOrders, {
      "usersid" : userId,
    });
    return response.fold(
          (l) => StatusRequest.serverFailure,
          (r) => r,
    );
  }
}
