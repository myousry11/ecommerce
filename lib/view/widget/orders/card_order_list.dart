import 'package:ecommerce/controller/orders/orderview_controller.dart';
import 'package:ecommerce/core/constant/routes.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../core/constant/color.dart';
import '../../../data/model/ordersmodel.dart';
import 'package:get/get.dart';

class CardOrderList extends GetView<OrderController> {
  final OrdersModel ordersModel;
  final String orderType;
  final String paymentType;
  final String orderStatus;
  final Color color;
  const CardOrderList({super.key, required this.ordersModel, required this.color, required this.orderType, required this.paymentType, required this.orderStatus});

  @override
  Widget build(BuildContext context) {
    String formattedDate = '';
    if (ordersModel.ordersDatetime != null) {
      DateTime dateTime = DateTime.parse(ordersModel.ordersDatetime!);
      formattedDate = controller.lang == 'en' ? DateFormat('dd/MM/yyyy').format(dateTime) : DateFormat('yyyy/MM/dd').format(dateTime);
    }
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 4,
      color: AppColor.white,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${"131".tr} #${ordersModel.ordersId}',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                Text(
                  formattedDate,    // Jiffy format : "${Jiffy(ordersModel.ordersDateTime!, "yyyy-MM-dd").fromNow()}"
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Text(
                  '132'.tr,
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(color: const Color(0xff777E90).withOpacity(0.5), fontWeight: FontWeight.w500),
                ),
                Text(
                  orderType,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 14, fontWeight: FontWeight.w700),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Text(
                  '133'.tr,
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(color: const Color(0xff777E90).withOpacity(0.5), fontWeight: FontWeight.w500),
                ),
                Text(
                  paymentType,
                  style: const TextStyle(fontSize: 14),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Text(
                  '134'.tr,
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(color: const Color(0xff777E90).withOpacity(0.5), fontWeight: FontWeight.w500),
                ),
                Text(
                  '${ordersModel.ordersTotalprice} ${"62".tr}',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: color.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    orderStatus.toString(),
                    style: TextStyle(
                      color: color,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: MaterialButton(
                    shape: RoundedRectangleBorder(
                        side: const BorderSide(
                            width: 2
                        ),
                        borderRadius: BorderRadius.circular(20)
                    ),
                    onPressed: () {
                      Get.toNamed(
                          AppRoute.ordersDetails,
                        arguments: {
                            "ordersModel" : ordersModel,
                            "ordersStatus" : orderStatus,
                        }
                      );
                    },
                    child:  Text('135'.tr),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}