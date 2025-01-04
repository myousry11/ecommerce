import 'package:ecommerce/controller/orders/orders_cancel_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../../../core/class/handlingdata_view.dart';
import '../../widget/orders/card_order_list.dart';
class OrdersCancelled extends StatelessWidget {
  const OrdersCancelled({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrdersCancelController>(
      builder: (controller) {
        return HandlingDataView(statusRequest: controller.statusRequest, widget: ListView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          itemCount: controller.data.length,
          itemBuilder: (context, index) {
            final order = controller.data[index];
            return CardOrderList(
              ordersModel: order,
              orderStatus: "89".tr,
              color: Colors.red,
              orderType: controller.printOrderType(order.ordersType?.toString() ?? ""),
              paymentType: controller.printPaymentType(order.ordersPaymentMethod?.toString() ?? ""),
            );
          },
        ));
      },
    );
  }
}
