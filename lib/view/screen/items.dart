import 'package:ecommerce/controller/items_controller.dart';
import 'package:ecommerce/core/class/handlingdata_view.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/view/widget/items/customlistitems.dart';
import 'package:ecommerce/view/widget/items/listcategoriesitems.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/model/categoriesmodel.dart';
import '../../data/model/itemsmodel.dart';

class Items extends GetView<ItemsControllerImp> {
  const Items({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            decoration: BoxDecoration(
              color: AppColor.white, // لون الخلفية
              shape: BoxShape.circle, // تحديد الشكل كدائرة
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.4), // لون الظل
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: IconButton(
              icon: const Icon(
                Icons.arrow_back_ios_new_outlined,
                size: 18,
              ),
              onPressed: (){
                Get.back();
              },
            ),
          ),
        ),
        backgroundColor: AppColor.white,
      ),
      body: Container(
        padding: const EdgeInsets.all(15),
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
                      childAspectRatio: 0.6,
                    ),
                    itemCount: controller.data.length,
                    itemBuilder: (BuildContext context, index) {
                      return CustomListItems(
                        itemsModel: ItemsModel.fromJson(controller.data[index]), active: false,
                      );
                    }))
              ],
            )
        ),
      ),
    );
  }
}
