import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/view/widget/custom_appbar_sub.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/address/view_controller.dart';
import '../../core/class/handlingdata_view.dart';
import '../../core/constant/routes.dart';
import '../../data/model/addressmodel.dart';
import 'edit.dart';

class AddressView extends StatelessWidget {
  const AddressView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: CustomAppbarSub(
          title: "Address",
          onPressed: () {
            Get.back();
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(AppRoute.addressAdd);
        },
        child: const Icon(Icons.add),
      ),
      body: GetBuilder<AddressViewController>(
        builder: (controller) => HandlingDataView(
          statusRequest: controller.statusRequest,
          widget: Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListView.separated(
              itemCount: controller.data.length,
              separatorBuilder: (context, index) => const SizedBox(height: 25),
              itemBuilder: (context, i) {
                return Dismissible(
                  key: Key(controller.data[i].addressId.toString()),
                  direction: DismissDirection.endToStart,
                  background: Container(
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: EdgeInsets.only(right: 16.0),
                        child: Text(
                          "Delete",
                          style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: AppColor.white),
                        ),
                      ),
                    ),
                  ),
                  onDismissed: (direction) {
                    controller.deleteAddress(controller.data[i].addressId!);
                  },
                  child: CardAddress(
                    addressModel: controller.data[i],
                    isSelected: controller.selectedAddressId == controller.data[i].addressId, // تحقق من الاختيار
                    onEdit: () {
                      Get.to(() => EditAddressPage(addressDetails: {
                        'addressId': controller.data[i].addressId,
                        'name': controller.data[i].addressName,
                        'city': controller.data[i].addressCity,
                        'street': controller.data[i].addressStreet,
                        'building': controller.data[i].addressBuilding,
                        'apartment': controller.data[i].addressApartment,
                        'lat': controller.data[i].addressLat,
                        'long': controller.data[i].addressLong,
                      }))?.then((_) {
                        controller.getData(); // إعادة تحميل البيانات عند العودة
                      });
                    },
                    onSelect: () {
                      controller.saveSelectedAddress(controller.data[i].addressId!);
                    },
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}


class CardAddress extends StatelessWidget {
  final AddressModel addressModel;
  final bool isSelected;
  final VoidCallback? onEdit;
  final VoidCallback? onSelect;

  const CardAddress({
    Key? key,
    required this.addressModel,
    required this.isSelected,
    this.onEdit,
    this.onSelect,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onSelect,
      child: Container(
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
          children: [
            Radio(
              value: true,
              groupValue: isSelected,
              onChanged: (value) {
                if (onSelect != null) onSelect!();
              },
              activeColor: AppColor.primaryColor,
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "SEND TO",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    addressModel.addressName!,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "${addressModel.addressCity!}, ${addressModel.addressStreet!}",
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: onEdit,
              child: const Text(
                "Edit",
                style: TextStyle(
                  color: AppColor.primaryColor,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
