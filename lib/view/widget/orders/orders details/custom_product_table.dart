import 'package:ecommerce/controller/orders/orders_details_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/constant/color.dart';
import '../../../../core/functions/translatedatabase.dart';
class CustomProductTable extends StatelessWidget {
  final OrdersDetailsController controller;
  const CustomProductTable({super.key, required this.controller});

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
          1: FlexColumnWidth(1),
          2: FlexColumnWidth(1.5),
        },
        children: [
          ...List.generate(
              controller.data.length,
                  (index) => TableRow(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 8.0),
                    child: Text(
                      "${translateDatabase(controller.data[index].itemsNameAr, controller.data[index].itemsName)}",
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 20),
                    child: Text(
                        'x${controller.data[index].countitems}',
                        style: const TextStyle(
                            color: AppColor.grey)),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 8.0),
                    child: Text(
                      '${controller.data[index].itemsprice} ${"62".tr}',
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(
                          fontSize: 15,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                ],
              )),
          const TableRow(
            children: [
              Divider(),
              Divider(),
              Divider(),
            ],
          ),
          TableRow(
            children: [
               Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: Text("141".tr),
              ),
              const SizedBox(),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  '${controller.ordersModel.ordersPrice} ${"62".tr}',
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(
                      fontSize: 15,
                      fontWeight: FontWeight.w700),
                ),
              ),
            ],
          ),
          TableRow(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: Text("140".tr),
              ),
              SizedBox(),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  'FREE',
                  style:
                  TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          const TableRow(
            children: [
              Divider(),
              Divider(),
              Divider(),
            ],
          ),
          TableRow(
            children: [
               Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: Text("134".tr),
              ),
              const SizedBox(),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  '${controller.ordersModel.ordersTotalprice} ${"62".tr}',
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(
                      fontSize: 15,
                      fontWeight: FontWeight.w700),
                ),
              ),
            ],
          ),
        ],
      ),
    );

  }
}
