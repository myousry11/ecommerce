import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/color.dart';
import '../../../data/model/addressmodel.dart';
class CardAddress extends StatelessWidget {
  final AddressModel addressModel;
  final bool isSelected;
  final VoidCallback? onEdit;

  const CardAddress({
    Key? key,
    required this.addressModel,
    required this.isSelected,
    this.onEdit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 10,
            spreadRadius: 1,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 Text(
                  "115".tr,
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  addressModel.addressName!,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  "${addressModel.addressCity!}, ${addressModel.addressStreet!}",
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: Colors.grey
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: onEdit,
            child:  Text(
              "116".tr,
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  color: AppColor.primaryColor,
                fontWeight: FontWeight.w700
              ),
            ),
          ),
        ],
      ),
    );
  }
}