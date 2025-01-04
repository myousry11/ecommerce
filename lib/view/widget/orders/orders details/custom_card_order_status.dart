import 'package:flutter/material.dart';

import '../../../../controller/orders/orders_details_controller.dart';
import '../../../../core/functions/orders_status_details.dart';
class CustomCardOrderStatus extends StatelessWidget {
  final OrdersDetailsController controller;
  const CustomCardOrderStatus({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  getStatusMessage(controller.orderStatus),
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  getStatusSubMessage(controller.orderStatus, controller.ordersModel.ordersRating != 0),
                  style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            flex: 1,
            child: Image.asset(
              getStatusIcon(controller.orderStatus),
              color: Colors.white,
              height: 40,
            ),
          ),
        ],
      ),
    );
  }
}
