import 'package:ecommerce/controller/address/add_conreoller.dart';
import 'package:ecommerce/controller/address/add_details_controller.dart';
import 'package:ecommerce/core/class/handlingdata_view.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/view/widget/auth/custom_button_auth.dart';
import 'package:ecommerce/view/widget/auth/custom_text_form_auth.dart';
import 'package:ecommerce/view/widget/custom_appbar_sub.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AddressAddDetails extends StatelessWidget {
  const AddressAddDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      // floatingActionButton: FloatingActionButton(
      //   onPressed: (){} ,
      //   child: Icon(Icons.add),
      // ),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80), // ارتفاع الـ AppBar
        child: CustomAppbarSub(
          title: "Add Details Address",
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 30),
        child: GetBuilder<AddAddressDetailsController>(builder: (controller) => HandlingDataView(
              statusRequest: controller.statusRequest,
              widget: ListView(
          children: [
            Row(
              children: [
                Expanded(
                  child: CustomTextFormAuth(
                      hintText: "Address name",
                      valid: (val){},
                      labelText: "Name",
                      myController: controller.name!
                  ),
                ),
                SizedBox(width: 20,),
                Expanded(
                  child: CustomTextFormAuth(
                      hintText: "Enter your city",
                      valid: (val){},
                      labelText: "City",
                      myController: controller.city!
                  ),
                ),
              ],
            ),
            SizedBox(height: 20,),
            CustomTextFormAuth(
                hintText: "Please enter your street",
                valid: (val){},
                labelText: "Street",
                myController: controller.street!
            ),
            SizedBox(height: 20,),
            Row(
              children: [
                Expanded(
                  child: CustomTextFormAuth(
                      hintText: "Building number",
                      valid: (val){},
                      labelText: "Building",
                      myController: controller.building!
                  ),
                ),
                SizedBox(width: 20,),
                Expanded(
                  child: CustomTextFormAuth(
                      hintText: "Apartment number",
                      valid: (val){},
                      labelText: "Apartment",
                      myController: controller.apartment!
                  ),
                ),
              ],
            ),
            SizedBox(height: 30,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50.0),
              child: CustomButtonAuth(title: "Add", onPressed: (){
                controller.addAddress(context);
              },),
            )
          ],
        ),)
        )
      ),
    );
  }
}
