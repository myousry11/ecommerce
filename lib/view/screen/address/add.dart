import 'package:ecommerce/controller/address/add_conreoller.dart';
import 'package:ecommerce/core/class/handlingdata_view.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/core/constant/routes.dart';
import 'package:ecommerce/view/widget/custom_appbar_sub.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AddressAdd extends StatelessWidget {
  const AddressAdd({super.key});

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
          title: "113".tr,
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: Container(
        child: GetBuilder<AddAddressController>(
            builder: (controller) => HandlingDataView(
                statusRequest: controller.statusRequest,
                widget: Column(
                  children: [
                    // CustomAppbarSub(
                    //   title: "Add new Address", onPressed: (){
                    //   Get.back();
                    // },
                    // ),
                    if (controller.kGooglePlex != null)
                      Expanded(
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            GoogleMap(
                              mapType: MapType.normal,
                              markers: controller.markers.toSet(),
                              onTap: (latLong) {
                                controller.addMarkers(latLong);
                              },
                              initialCameraPosition: controller.kGooglePlex!,
                              onMapCreated:
                                  (GoogleMapController controllerMap) {
                                controller.controllerCompleter!
                                    .complete(controllerMap);
                              },
                            ),
                            Positioned(
                              bottom: 10,
                                child: MaterialButton(
                                  height: 40,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  color: AppColor.primaryColor,
                                  minWidth: 150,
                                    onPressed: (){
                                    controller.goToAddDetailsAddress();
                                    },
                                  child:  Text(
                                      "13".tr,
                                      style: Theme.of(context).textTheme.bodySmall!.copyWith(color:AppColor.white, fontSize: 16)
                                  ),
                                )
                            ),
                          ],
                        ),
                      )
                  ],
                ))),
      ),
    );
  }
}
