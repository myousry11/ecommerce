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
          title: "130".tr,
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
                      hintText: "118".tr,
                      valid: (val){},
                      labelText: "119".tr,
                      myController: controller.name!
                  ),
                ),
                SizedBox(width: 20,),
                Expanded(
                  child: CustomTextFormAuth(
                      hintText: "125".tr,
                      valid: (val){},
                      labelText: "120".tr,
                      myController: controller.city!
                  ),
                ),
              ],
            ),
            SizedBox(height: 20,),
            CustomTextFormAuth(
                hintText: "126".tr,
                valid: (val){},
                labelText: "121".tr,
                myController: controller.street!
            ),
            SizedBox(height: 20,),
            Row(
              children: [
                Expanded(
                  child: CustomTextFormAuth(
                      hintText: "127".tr,
                      valid: (val){},
                      labelText: "122".tr,
                      myController: controller.building!
                  ),
                ),
                SizedBox(width: 20,),
                Expanded(
                  child: CustomTextFormAuth(
                      hintText: "128".tr,
                      valid: (val){},
                      labelText: "123".tr,
                      myController: controller.apartment!
                  ),
                ),
              ],
            ),
            SizedBox(height: 30,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50.0),
              child: CustomButtonAuth(title: "129".tr, onPressed: (){
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
