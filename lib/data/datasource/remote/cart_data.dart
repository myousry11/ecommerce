import 'package:ecommerce/core/class/crud.dart';
import 'package:ecommerce/linkapi.dart';

class CartData {
  Crud crud;
  CartData(this.crud);

  addCart(String usersId, int itemsId) async{
    var response = await crud.postData(AppLink.cartAdd, {
      "usersid" :usersId,
      "itemsid" : itemsId.toString()
    });
    return response.fold((l) => 1, (r) => r);
  }

  removeCart(String usersId, int itemsId) async{
    var response = await crud.postData(AppLink.cartDelete, {
      "usersid" :usersId,
      "itemsid" : itemsId.toString()
    });
    return response.fold((l) => 1, (r) => r);
  }

  getCountCart(String usersId, int itemsId) async{
    var response = await crud.postData(AppLink.cartGetCountItems, {
      "usersid" :usersId,
      "itemsid" : itemsId.toString()
    });
    return response.fold((l) => 1, (r) => r);
  }

  viewCart(String usersId) async{
    var response = await crud.postData(AppLink.cartView, {
      "usersid" :usersId,
    });
    return response.fold((l) => 1, (r) => r);
  }


  checkCoupon(String couponName) async{
    var response = await crud.postData(AppLink.checkCoupon, {
      "couponname" :couponName,
    });
    return response.fold((l) => 1, (r) => r);
  }
}