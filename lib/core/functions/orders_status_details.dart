
import 'package:get/get.dart';

import '../constant/iconassets.dart';

String getStatusIcon(String status) {

  if (status == "84".tr) {
    return AppIconAsset.delivered;
  } else if (status == "86".tr) {
    return AppIconAsset.preparing;
  } else if (status == "85".tr) {
    return AppIconAsset.pending;
  } else if (status == "87".tr) {
    return AppIconAsset.shipping;
  } else if (status == "89".tr) {
    return AppIconAsset.cancelOrder;
  } else {
    return AppIconAsset.info;
  }
}


String getStatusMessage(String status) {

  if (status == "84".tr) {
    return "91".tr;
  } else if (status == "86".tr) {
    return "92".tr;
  } else if (status == "85".tr) {
    return "93".tr;
  } else if (status == "87".tr) {
    return "94".tr;
  } else if (status == "89".tr) {
    return "95".tr;
  } else {
    return "96".tr;
  }
}

String getStatusSubMessage(String status, bool isRated) {

  if (status == "84".tr) {
    return isRated
        ? "97".tr
        : "98".tr;
  } else if (status == "86".tr) {
    return "99".tr;
  } else if (status == "85".tr) {
    return "100".tr;
  } else if (status == "87".tr) {
    return "101".tr;
  } else if (status == "89".tr) {
    return "102".tr;
  } else {
    return "103".tr;
  }
}

