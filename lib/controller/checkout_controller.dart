import 'package:ecommerce/core/class/statusrequest.dart';
import 'package:ecommerce/core/constant/routes.dart';
import 'package:ecommerce/core/services/services.dart';
import 'package:ecommerce/data/datasource/remote/addressData.dart';
import 'package:ecommerce/data/datasource/remote/checkout_data.dart';
import 'package:ecommerce/data/model/addressmodel.dart';
import 'package:get/get.dart';

import '../core/functions/handlingdata_controller.dart';

class CheckoutController extends GetxController {
  StatusRequest statusRequest = StatusRequest.none;

  AddressData addressData = Get.put(AddressData(Get.find()));
  CheckoutData checkoutData = Get.put(CheckoutData(Get.find()));
  MyServices myServices = Get.find();

  String? paymentType;
  String? receiptType;
  String addressId = "0";

  List<AddressModel> dataAddress = [];

  // المتغير الخاص بالـ Stepper
  int currentStep = 0;

  // القيم المستقبلة من شاشة السلة
  late double priceOrders;
  late String discountCoupon;
  late String couponId;
  late double totalPrice;

  // اختيار طريقة الدفع
  choosePaymentMethod(String val) {
    paymentType = val;
    update();
  }

  // اختيار نوع الإيصال
  chooseReceiptMethod(String val) {
    receiptType = val;
    update();
  }

  // اختيار عنوان الشحن
  chooseShippingAddress(String val) {
    addressId = val;
    update();
  }

  // تحديث الخطوة الحالية للـ Stepper
  updateStep(int step) {
    currentStep = step;
    update();
  }

  // الانتقال إلى الخطوة التالية
  nextStep() {
    if (currentStep < 2) {
      currentStep++;
      update();
    }
  }

  // العودة إلى الخطوة السابقة (اختياري)
  previousStep() {
    if (currentStep > 0) {
      currentStep--;
      update();
    }
  }

  // جلب عناوين الشحن
  getShippingAddress() async {
    statusRequest = StatusRequest.loading;

    var response = await addressData
        .getData(myServices.sharedPreferences.getString("id")!);

    print("=============================== Controller $response ");

    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        List listData = response['data'];
        dataAddress.addAll(listData.map((e) => AddressModel.fromJson(e)));
        addressId = dataAddress[0].addressId.toString();
      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
    update();
  }

  checkAddress() {
    if (dataAddress.isEmpty) {
      Get.snackbar("171".tr, "161".tr);
      return false;
    }
    return true;
  }




  checkout() async {
    statusRequest = StatusRequest.loading;

    Map data = {
      "usersid" : myServices.sharedPreferences.getString("id"),
      "addressid" : addressId.toString(),
      "orderstype" : receiptType.toString(),
      "pricedelivery" : "10",
      "couponid" : couponId,
      "paymentmethod" : paymentType.toString(),
      "discountcoupon" : discountCoupon.toString() ,
      "ordersprice" : priceOrders.toString(),
    };

    var response = await checkoutData
        .checkout(data);

    print("=============================== Controller $response ");

    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        updateStep(2);

      } else {
        statusRequest = StatusRequest.none;
        Get.snackbar("171".tr, "172".tr);
      }
      // End
    }
    update();
  }

  goToAddNewAddress() {
    Get.toNamed(AppRoute.addressAdd);
  }


  @override
  void onInit() {
    priceOrders = Get.arguments['priceOrders'];
    discountCoupon = Get.arguments['discountcoupon'].toString();
    couponId = Get.arguments['couponid'];
    totalPrice = Get.arguments['totalPrice'];

    getShippingAddress();
    super.onInit();
  }
}
