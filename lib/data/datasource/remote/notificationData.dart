import 'package:ecommerce/linkapi.dart';
import '../../../core/class/crud.dart';
import '../../../core/class/statusrequest.dart';

class NotificationData {
  Crud crud;
  NotificationData(this.crud);

  getData(String userId) async {
    var response = await crud.postData(AppLink.notification, {
      "id" : userId
    });
    return response.fold(
          (l) => StatusRequest.serverFailure,
          (r) => r,
    );
  }
}
