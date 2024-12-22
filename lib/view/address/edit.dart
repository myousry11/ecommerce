import 'package:ecommerce/controller/address/edit_controller.dart';
import 'package:ecommerce/core/class/handlingdata_view.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/view/widget/auth/custom_button_auth.dart';
import 'package:ecommerce/view/widget/auth/custom_text_form_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widget/custom_appbar_sub.dart';

class EditAddressPage extends StatelessWidget {
  final Map addressDetails;
  const EditAddressPage({super.key, required this.addressDetails});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: CustomAppbarSub(
          title: "Edit Address",
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: GetBuilder<EditAddressController>(
        init: EditAddressController()..initializeData(addressDetails),
        builder: (controller) => HandlingDataView(
          statusRequest: controller.statusRequest,
          widget: Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListView(
              children: [
                CustomTextFormAuth(
                  hintText: "Address name",
                  valid: (val) {},
                  labelText: "Name",
                  myController: controller.name!,
                ),
                const SizedBox(height: 20),
                CustomTextFormAuth(
                  hintText: "City",
                  valid: (val) {},
                  labelText: "City",
                  myController: controller.city!,
                ),
                const SizedBox(height: 20),
                CustomTextFormAuth(
                  hintText: "Street",
                  valid: (val) {},
                  labelText: "Street",
                  myController: controller.street!,
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: CustomTextFormAuth(
                        hintText: "Building",
                        valid: (val) {},
                        labelText: "Building",
                        myController: controller.building!,
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: CustomTextFormAuth(
                        hintText: "Apartment",
                        valid: (val) {},
                        labelText: "Apartment",
                        myController: controller.apartment!,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                CustomButtonAuth(
                  title: "Save Changes",
                  onPressed: () {
                    controller.editAddress(context);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
