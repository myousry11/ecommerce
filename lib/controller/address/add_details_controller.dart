import 'package:ecommerce/controller/address/view_controller.dart';
import 'package:ecommerce/core/constant/routes.dart';
import 'package:ecommerce/core/services/services.dart';
import 'package:ecommerce/data/datasource/remote/addressData.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../core/class/statusrequest.dart';
import '../../core/functions/bottomsheet.dart';
import '../../core/functions/handlingdata_controller.dart';

class AddAddressDetailsController extends GetxController {
  StatusRequest statusRequest = StatusRequest.none;

  TextEditingController? name;
  TextEditingController? city;
  TextEditingController? street;
  TextEditingController? building;
  TextEditingController? apartment;

  String? lat;
  String? long;

  AddressData addressData = AddressData(Get.find());
  MyServices myServices = Get.find();

  initialData() {
    name = TextEditingController();
    city = TextEditingController();
    street = TextEditingController();
    building = TextEditingController();
    apartment = TextEditingController();

    lat = Get.arguments['lat'];
    long = Get.arguments['long'];

    print(lat);
    print(long);
  }

  addAddress(BuildContext context) async {
    statusRequest = StatusRequest.loading;
    update();

    var response = await addressData.addData(
      myServices.sharedPreferences.getString("id")!,
      name!.text,
      city!.text,
      street!.text,
      building!.text,
      apartment!.text,
      lat!,
      long!,
    );

    print("=============================== Controller $response ");

    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        // استدعاء AddressViewController وتحديث البيانات
        Get.offAllNamed(AppRoute.home);
        showCustomBottomSheet(
          context: context,
          onPressed: () {
            Get.back();
          },
          imageAsset: 'assets/icons/success.gif',
          title: "Success!",
          textBody: "Address has been successfully set as a shipping orders",
          textButton: "OK",
        );
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }


  @override
  void onInit() {
    initialData();
    super.onInit();
  }
}
