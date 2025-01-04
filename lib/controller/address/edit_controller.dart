import 'package:ecommerce/controller/address/view_controller.dart';
import 'package:ecommerce/core/class/statusrequest.dart';
import 'package:ecommerce/core/functions/handlingdata_controller.dart';
import 'package:ecommerce/data/datasource/remote/addressData.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../core/functions/bottomsheet.dart';

class EditAddressController extends GetxController {
  StatusRequest statusRequest = StatusRequest.none;

  TextEditingController? name;
  TextEditingController? city;
  TextEditingController? street;
  TextEditingController? building;
  TextEditingController? apartment;

  String? lat;
  String? long;
  String? addressId;

  AddressData addressData = AddressData(Get.find());

  // استيراد البيانات الحالية
  void initializeData(Map addressDetails) {
    addressId = addressDetails['addressId'].toString();
    name = TextEditingController(text: addressDetails['name']);
    city = TextEditingController(text: addressDetails['city']);
    street = TextEditingController(text: addressDetails['street']);
    building = TextEditingController(text: addressDetails['building']);
    apartment = TextEditingController(text: addressDetails['apartment']);
    lat = addressDetails['lat'].toString();
    long = addressDetails['long'].toString();
  }

  editAddress(BuildContext context) async {
    statusRequest = StatusRequest.loading;
    update();

    var response = await addressData.editData(
      addressId!,
      name!.text,
      city!.text,
      street!.text,
      building!.text,
      apartment!.text,
      lat!,
      long!,
    );

    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        showCustomBottomSheet(
          context: context,
          onPressed: () {
            Get.back();
            Get.back();
          },
          imageAsset: 'assets/icons/success.gif',
          title: "176".tr,
          textBody: "189".tr,
          textButton: "182".tr,
        );
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }
}
