import 'package:ecommerce/controller/orders/orders_delivered_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../../../core/class/handlingdata_view.dart';
import '../../widget/orders/card_order_list.dart';
class OrdersDelivered extends StatelessWidget {
  const OrdersDelivered({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrdersDeliveredController>(
      builder: (controller) {
        return HandlingDataView(statusRequest: controller.statusRequest, widget: ListView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          itemCount: controller.data.length,
          itemBuilder: (context, index) {
            final order = controller.data[index];
            return CardOrderList(
              ordersModel: order,
              orderStatus: "84".tr,
              color: Colors.green,
              orderType: controller.printOrderType(order.ordersType?.toString() ?? ""),
              paymentType: controller.printPaymentType(order.ordersPaymentMethod?.toString() ?? ""),
            );
          },
        ));
      },
    );
  }
}
