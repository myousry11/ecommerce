import 'package:ecommerce/controller/items_controller.dart';
import 'package:ecommerce/core/class/handlingdata_view.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/view/widget/items/customlistitems.dart';
import 'package:ecommerce/view/widget/items/listcategoriesitems.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/model/categoriesmodel.dart';
import '../../data/model/itemsmodel.dart';
import '../widget/custom_appbar_sub.dart';

class Items extends GetView<ItemsControllerImp> {
  const Items({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80), // ارتفاع الـ AppBar
        child: CustomAppbarSub(
          title: "163".tr,
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: GetBuilder<ItemsControllerImp>(
            builder: (controller) => ListView(
              children: [
                const CustomCategoriesListItems(),
                HandlingDataView(
                    statusRequest: controller.statusRequest,
                    widget: GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.55,
                    ),
                    itemCount: controller.data.length,
                    itemBuilder: (BuildContext context, index) {
                      return SizedBox(
                        width: double.infinity,
                        child: CustomListItems(
                          itemsModel: ItemsModel.fromJson(controller.data[index]), active: false,
                        ),
                      );
                    }))
              ],
            )
        ),
      ),
    );
  }
}
