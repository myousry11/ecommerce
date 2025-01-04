import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/view/widget/custom_appbar_sub.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/address/view_controller.dart';
import '../../../core/class/handlingdata_view.dart';
import '../../../core/constant/routes.dart';
import '../../../data/model/addressmodel.dart';
import '../../widget/address/custom_card_address.dart';
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
          title: "78".tr,
          onPressed: () {
            Get.back();
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColor.primaryColor,
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
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Align(
                        alignment: controller.lang == 'en' ? Alignment.centerRight : Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.only(right: 16.0),
                          child: Text(
                            "114".tr,
                            style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: AppColor.white, fontWeight: FontWeight.w700),
                          ),
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
