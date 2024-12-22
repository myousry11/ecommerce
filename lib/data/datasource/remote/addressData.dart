import 'package:ecommerce/linkapi.dart';
import '../../../core/class/crud.dart';
import '../../../core/class/statusrequest.dart';

class AddressData {
  Crud crud;
  AddressData(this.crud);

  getData(String usersId) async {
    var response = await crud.postData(AppLink.addressView, {
      "usersid" : usersId
    });
    return response.fold(
          (l) => StatusRequest.serverFailure,
          (r) => r,
    );
  }

  addData(String usersId, String name, String city, String street, String building, String apartment, String lat, String long) async {
    var response = await crud.postData(AppLink.addressAdd, {
      "usersid" : usersId,
      "name" : name,
      "city" : city,
      "street" : street,
      "building": building,
      "apartment" : apartment,
      "lat": lat,
      "long": long,
    });
    return response.fold(
          (l) => StatusRequest.serverFailure,
          (r) => r,
    );
  }
  deleteData(String addressId) async {
    var response = await crud.postData(AppLink.addressDelete, {
      "addressid": addressId,
    });
    return response.fold(
          (l) => StatusRequest.serverFailure,
          (r) => r,
    );
  }

  editData(String addressId, String name, String city, String street, String building, String apartment, String lat, String long) async {
    var response = await crud.postData(AppLink.addressEdit, {
      "addressid" : addressId,
      "name" : name,
      "city" : city,
      "street" : street,
      "building" : building,
      "apartment" : apartment,
      "lat" : lat,
      "long" : long
    });
    return response.fold(
          (l) => StatusRequest.serverFailure,
          (r) => r,
    );
  }


}
