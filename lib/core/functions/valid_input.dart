

import 'package:get/get.dart';

validInput(String val, int min, int max, String type, String title, {String? originalPassword}) {
  if (val.isEmpty) {
    return "$title ${"43".tr}";
  }

  if (type == "username") {
    if (!GetUtils.isUsername(val)) {
      return "$title ${"46".tr}";
    }
  }

  if (type == "email") {
    if (!GetUtils.isEmail(val)) {
      return "$title ${"46".tr}";
    }
  }

  if (type == "phone") {
    if (!GetUtils.isPhoneNumber(val)) {
      return "$title ${"46".tr}";
    }
  }

  if (val.length < min) {
    return "$title ${"44".tr} $min";
  }

  if (val.length > max) {
    return "$title ${"45".tr} $max";
  }

  if (type == "password" && originalPassword != null && val != originalPassword) {
    return "$title ${"47".tr}";
  }

  return null;
}
