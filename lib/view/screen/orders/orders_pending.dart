import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../../../controller/orders/order_pending_controller.dart';
import '../../../core/class/handlingdata_view.dart';
import '../../widget/orders/card_order_list.dart';
class OrdersPending extends StatelessWidget {
  const OrdersPending({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrdersPendingController>(
      builder: (controller) {
        return HandlingDataView(statusRequest: controller.statusRequest, widget: ListView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          itemCount: controller.data.length,
          itemBuilder: (context, index) {
            final order = controller.data[index];
            final orderStatus = controller.printOrderStatus(order.ordersStatus?.toString() ?? "");
            final color = _getColorStatus(orderStatus);
            return CardOrderList(
              ordersModel: order,
              orderStatus: orderStatus,
              color: color,
              orderType: controller.printOrderType(order.ordersType?.toString() ?? ""),
              paymentType: controller.printPaymentType(order.ordersPaymentMethod?.toString() ?? ""),
            );
          },
        ));
      },
    );
  }
  Color _getColorStatus(String translatedStatus) {
    if (translatedStatus == "85".tr) {
      return Colors.orange;
    } else if (translatedStatus == "86".tr) {
      return Colors.blue;
    } else if (translatedStatus == "87".tr) {
      return Colors.green;
    } else {
      return Colors.grey;
    }
  }

}
