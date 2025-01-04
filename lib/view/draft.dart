// import 'package:ecommerce/controller/checkout_controller.dart';
// import 'package:ecommerce/core/class/handlingdata_view.dart';
// import 'package:ecommerce/core/constant/color.dart';
// import 'package:ecommerce/core/constant/imageassets.dart';
// import 'package:ecommerce/view/widget/checkout/card_address.dart';
// import 'package:ecommerce/view/widget/checkout/card_payment_method_checkout.dart';
// import 'package:ecommerce/view/widget/checkout/card_receipt_type.dart';
// import 'package:ecommerce/view/widget/checkout/custom_sub_title_checkout.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// import '../widget/cart/custom_button_cart.dart';
// import '../widget/custom_appbar_sub.dart';
//
// class CheckOut extends StatelessWidget {
//   const CheckOut({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: PreferredSize(
//         preferredSize: const Size.fromHeight(80),
//         child: CustomAppbarSub(
//           title: "Check out",
//           onPressed: () {
//             Get.back();
//           },
//         ),
//       ),
//       backgroundColor: AppColor.white,
//       body: GetBuilder<CheckoutController>(
//         builder: (controller) => HandlingDataView(
//             statusRequest: controller.statusRequest,
//             widget: Container(
//                 padding: EdgeInsets.all(20),
//                 child:  ListView(
//                   children: [
//                     CustomSubTitleCheckout(title: "Choose Payment Method"),
//                     SizedBox(
//                       height: 10,
//                     ),
//                     CardPaymentMethodCheckOut(
//                         title: "Cash on Delivery",
//                         isActive: controller.paymentType == "cash" ? true : false,
//                         onTap: (){
//                           controller.choosePaymentMethod("cash");
//                         }
//                     ),
//                     SizedBox(
//                       height: 10,
//                     ),
//                     CardPaymentMethodCheckOut(
//                         title: "Payment Cards",
//                         isActive: controller.paymentType == "card" ? true : false,
//                         onTap: (){
//                           controller.choosePaymentMethod("card");
//                         }
//                     ),
//                     SizedBox(
//                       height: 25,
//                     ),
//                     CustomSubTitleCheckout(title: "Choose Receipt Type"),
//                     SizedBox(
//                       height: 10,
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                       children: [
//                         CardReceiptTypeCheckout(
//                             title: "Delivery",
//                             image: AppImageAsset.shipping,
//                             isActive: controller.receiptType == "delivery" ? true : false,
//                             onTap: (){
//                               controller.chooseReceiptMethod("delivery");
//                             }
//                         ),
//                         SizedBox(
//                           width: 20,
//                         ),
//                         CardReceiptTypeCheckout(
//                             title: "Store",
//                             image: AppImageAsset.store,
//                             isActive: controller.receiptType == "store" ? true : false,
//                             onTap: (){
//                               controller.chooseReceiptMethod("store");
//                             }
//                         ),
//                       ],
//                     ),
//                     SizedBox(
//                       height: 25,
//                     ),
//                     if(controller.receiptType == "delivery")
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           CustomSubTitleCheckout(title: "Shipping Address"),
//                           SizedBox(
//                             height: 10,
//                           ),
//                           ...List.generate(controller.dataAddress.length, (index) => CardShippingAddressCheckout(
//                             title: '${controller.dataAddress[index].addressName}',
//                             subTitle: '${controller.dataAddress[index].addressCity} - ${controller.dataAddress[index].addressStreet}',
//                             isActive: controller.addressId == controller.dataAddress[index].addressId.toString() ? true : false ,
//                             onTap: (){
//                               controller.chooseShippingAddress(controller.dataAddress[index].addressId.toString());
//                             },
//                           ))
//                         ],
//                       ),
//                   ],
//                 )
//             )),
//       ),
//       bottomNavigationBar: Container(
//         padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
//         child: CustomButtonCart(
//           title: "Continue to payment",
//           onPressed: () {},
//         ),
//       ),
//     );
//   }
// }




import 'dart:async';
import 'package:ecommerce/core/class/statusrequest.dart';
import 'package:ecommerce/core/functions/handlingdata_controller.dart';
import 'package:ecommerce/core/services/services.dart';
import 'package:ecommerce/data/datasource/remote/homedata.dart';
import 'package:ecommerce/data/model/itemsmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/constant/routes.dart';

abstract class HomeController extends GetxController {
  initialData();
  getData();
  showAllItems(String categoryId);
  changeCat(int val);
  goToPageProduct(ItemsModel itemsModel);
}

class HomeControllerImp extends HomeController {
  MyServices myServices = Get.find();
  StatusRequest statusRequest = StatusRequest.none;
  HomeData homeData = HomeData(Get.find());

  List categories = [];
  List subCategories = [];
  List items = [];
  List topSellingItems = []; // لتخزين العناصر الأكثر مبيعًا للفئة المحددة
  Map<String, List> categoryItems = {}; // خريطة لتخزين العناصر لكل فئة
  Map<String, List> topSellingCategoryItems = {}; // خريطة لتخزين العناصر الأكثر مبيعًا لكل فئة

  String? name;
  String? email;

  late PageController pageController;
  Timer? _pageTimer;

  int currentIndex = 0;
  String? lang;

  int selectedCat = 1;

  @override
  initialData() {
    lang = myServices.sharedPreferences.getString("lang");
    name = myServices.sharedPreferences.getString("name") ?? "Guest";
    email = myServices.sharedPreferences.getString("email") ?? "guest@example.com";
    selectedCat = (categories.isNotEmpty) ? 0 : 1;
  }

  @override
  void onInit() {
    pageController = PageController();
    getData();
    initialData();
    _startAutoPageChange();
    super.onInit();
  }

  void _startAutoPageChange() {
    _pageTimer = Timer.periodic(const Duration(seconds: 3), (timer) {
      if (pageController.hasClients) {
        int totalPages = 3; // عدد الصور
        int nextPage = (currentIndex + 1) % totalPages;
        pageController.animateToPage(
          nextPage,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
        currentIndex = nextPage;
      }
    });
  }

  void onPageChanged(int index) {
    currentIndex = index;
  }

  @override
  getData() async {
    statusRequest = StatusRequest.loading;
    var response = await homeData.getDataa(); // استرجاع البيانات
    debugPrint("Response: $response");
    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        categories = response['categories'] ?? [];
        subCategories = response['subcategories'] ?? [];

        if (response['items'] != null) {
          // ربط العناصر بالفئات
          for (var category in categories) {
            categoryItems[category['categories_id'].toString()] = response['items']
                .where((item) => item['items_category'] == category['categories_id'])
                .toList();
          }
        }

        if (response['topselling'] != null) {
          // ربط العناصر الأكثر مبيعًا بالفئات
          for (var category in categories) {
            topSellingCategoryItems[category['categories_id'].toString()] = response['topselling']
                .where((item) => item['items_category'] == category['categories_id'])
                .toList();
          }
        }

        if (categories.isNotEmpty) {
          selectedCat = 0;
          await getItems(categories[selectedCat]['categories_id'].toString());
        }
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }


  Future<void> loadCategoryData(String categoryId) async {
    if (categoryItems.containsKey(categoryId)) {
      items = categoryItems[categoryId] ?? [];
    } else {
      await getItems(categoryId);
    }

    if (topSellingCategoryItems.containsKey(categoryId)) {
      topSellingItems = topSellingCategoryItems[categoryId] ?? [];
    } else {
      topSellingItems = [];
    }
    update();
  }

  getItems(String categoryId) async {
    statusRequest = StatusRequest.loading;
    var response = await homeData.getDataa();
    debugPrint("Response for categoryId $categoryId: $response");

    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        categoryItems[categoryId] = response['items'] ?? [];
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  changeCat(int val) async {
    selectedCat = val;
    if (categories.isNotEmpty) {
      String categoryId = categories[val]['categories_id'].toString();

      if (categoryItems.containsKey(categoryId)) {
        items = categoryItems[categoryId] ?? [];
      } else {
        await getItems(categoryId);
      }

      if (topSellingCategoryItems.containsKey(categoryId)) {
        topSellingItems = topSellingCategoryItems[categoryId] ?? [];
      } else {
        topSellingItems = [];
      }
    }
    update();
  }

  @override
  showAllItems(String categoryId) async {
    if (categoryId.isEmpty) return;

    var response = await homeData.getDataa();

    if (response['status'] == "success") {
      List subCategories = response['subcategories']?.where((sub) {
        return sub['subcategories_category'].toString() == categoryId;
      }).toList() ?? [];

      Get.toNamed(
        AppRoute.items,
        arguments: {
          "catid": categoryId,
          "subCategory": subCategories,
        },
      );
    }
  }

  @override
  goToPageProduct(itemsModel) {
    Get.toNamed(AppRoute.productDetails, arguments: {"itemsmodel": itemsModel});
  }

  @override
  void onReady() {
    super.onReady();
    if (pageController.hasClients) {
      pageController.jumpToPage(0);
    }
  }

  @override
  void dispose() {
    pageController.dispose();
    _pageTimer?.cancel();
    categories.clear();
    super.dispose();
  }
}
