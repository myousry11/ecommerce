import 'package:ecommerce/core/class/statusrequest.dart';
import 'package:ecommerce/core/services/services.dart';
import 'package:ecommerce/data/datasource/remote/addressData.dart';
import 'package:ecommerce/data/model/addressmodel.dart';
import 'package:get/get.dart';

import '../../core/functions/handlingdata_controller.dart';

class AddressViewController extends GetxController {
  AddressData addressData = AddressData(Get.find());
  List<AddressModel> data = [];
  StatusRequest statusRequest = StatusRequest.none;
  MyServices myServices = Get.find();

  int? selectedAddressId;

  String? lang;
  // استرجاع العنوان المختار من SharedPreferences
  void loadSelectedAddress() {
    selectedAddressId = myServices.sharedPreferences.getInt("selectedAddressId");
  }

  // حفظ العنوان المختار في SharedPreferences
  // void saveSelectedAddress(int addressId) {
  //   selectedAddressId = addressId;
  //   myServices.sharedPreferences.setInt("selectedAddressId", addressId);
  //   update();
  // }

  getData() async {
    statusRequest = StatusRequest.loading;

    var response = await addressData.getData(
      myServices.sharedPreferences.getString("id")!,
    );

    print("=============================== Controller $response ");

    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        data.clear();
        List listData = response['data'];
        data.addAll(listData.map((e) => AddressModel.fromJson(e)));

        if (data.isEmpty) {
          statusRequest = StatusRequest.failure;
          update();
        }
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  deleteAddress(int addressId) {
    addressData.deleteData(addressId.toString());
    data.removeWhere((element) => element.addressId == addressId);

    // إذا تم حذف العنوان المختار، أزل الاختيار
    if (selectedAddressId == addressId) {
      selectedAddressId = null;
      myServices.sharedPreferences.remove("selectedAddressId");
    }

    if (data.isEmpty) {
      statusRequest = StatusRequest.failure;
    }
    update();
  }

  @override
  void onInit() {
    loadSelectedAddress();
    lang = myServices.sharedPreferences.getString("lang");
    getData();
    super.onInit();
  }
}
