import 'package:ecommerce/controller/orders/orders_details_controller.dart';
import 'package:ecommerce/core/class/handlingdata_view.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/core/constant/iconassets.dart';
import 'package:ecommerce/core/constant/routes.dart';
import 'package:ecommerce/view/widget/orders/orders%20details/custom_orders_buttons.dart';
import 'package:ecommerce/view/widget/orders/orders%20details/custom_product_table.dart';
import 'package:ecommerce/view/widget/orders/orders%20details/dialograteorder.dart';
import 'package:ecommerce/view/widget/orders/orders%20details/orders_details_table.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widget/custom_appbar_sub.dart';
import '../../widget/orders/orders details/custom_card_order_status.dart';

class OrdersDetails extends StatelessWidget {
  const OrdersDetails({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: CustomAppbarSub(
          title: "90".tr,
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GetBuilder<OrdersDetailsController>(
          builder: (controller) => HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Container الأعلى
                CustomCardOrderStatus(
                  controller: controller,
                ),
                const SizedBox(height: 16),
                OrdersDetailsTable(controller: controller),
                const SizedBox(height: 20),
                // بطاقة المنتجات باستخدام Table
                CustomProductTable(controller: controller),
                const Spacer(),
                CustomOrdersButtons(
                  orderStatus: controller.orderStatus,
                  onCancelOrder: () {
                    controller.cancelOrder();
                  },
                  onContinueShopping: () {
                    Get.back();
                  },
                  onDeleteOrder: () {
                    controller.deleteOrder();
                  },
                  onReturnHome: () {
                    Get.offNamed(AppRoute.home);
                  },
                  onRateOrder: (){
                    showDialogRatingOrder(context, controller.ordersModel.ordersId.toString());
                  }, ordersRating: controller.ordersModel.ordersRating!,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
