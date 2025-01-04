import 'package:ecommerce/view/screen/orders/orders_cancelled.dart';
import 'package:ecommerce/view/screen/orders/orders_delivered.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/orders/orderview_controller.dart';
import '../../../core/constant/color.dart';
import '../../widget/orders/custom_ordertype_button.dart';
import 'orders_pending.dart';

class Orders extends StatelessWidget {
  const Orders({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      body: GetBuilder<OrderController>(
        builder: (controller) {
          return Column(
            children: [
              // الأزرار للتنقل بين الأقسام
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CustomOrderTypeButton("82".tr, 0),
                    CustomOrderTypeButton("83".tr, 1),
                    CustomOrderTypeButton("88".tr, 2),
                  ],
                ),
              ),
              // عرض الطلبات باستخدام ListView مع AnimatedSwitcher
              Expanded(
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 700),
                  child: _getSelectedOrderWidget(controller.selectedIndex),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _getSelectedOrderWidget(int selectedIndex) {
    switch (selectedIndex) {
      case 0:
        return const OrdersPending(key: ValueKey(0));
      case 1:
        return const OrdersDelivered(key: ValueKey(1));
      case 2:
        return const OrdersCancelled(key: ValueKey(2));
      default:
        return Container(); // الحالة الافتراضية
    }
  }
}

