import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controller/orders/orders_details_controller.dart';
class OrdersDetailsTable extends StatelessWidget {
  final OrdersDetailsController controller;
  const OrdersDetailsTable({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Table(
        columnWidths: const {
          0: FlexColumnWidth(3),
          1: FlexColumnWidth(3),
        },
        children: [
          TableRow(
            children: [
               Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  "110".tr,
                  style: const TextStyle(color: Colors.grey),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  "#${controller.ordersModel.ordersId}",
                  style:
                  const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          // _buildTableRow('Tracking Number', 'IK987362341'),
          TableRow(
            children: [
               Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  "111".tr,
                  style: const TextStyle(color: Colors.grey),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  controller.ordersModel.ordersType == "0"
                      ? "${controller.ordersModel.addressCity} ${controller.ordersModel.addressStreet}"
                      : "112".tr,
                  style:
                  const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
