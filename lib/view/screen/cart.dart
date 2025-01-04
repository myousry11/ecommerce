import 'package:ecommerce/controller/cart_controller.dart';
import 'package:ecommerce/core/class/handlingdata_view.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/view/widget/custom_appbar_sub.dart';
import 'package:ecommerce/view/widget/cart/custom_bottom_nav.dart';
import 'package:ecommerce/view/widget/productdetails/custom_line_divider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/functions/translatedatabase.dart';
import '../widget/cart/custom_card_item.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      body: GetBuilder<CartController>(
          builder: (controller) => ListView(
                children: [
                  CustomAppbarSub(
                    title: '142'.tr,
                    onPressed: (){
                      controller.backToHome();
                    },
                  ),
                  HandlingDataView(
                      statusRequest: controller.statusRequest,
                      widget: Column(
                        children: [
                          ...List.generate(
                            controller.data.length,
                            (index) => Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CartItem(
                                imageUrl: "${controller.data[index].itemsImage}",
                                title: "${translateDatabase(controller.data[index].itemsNameAr,controller.data[index].itemsName)}",
                                price: "${controller.data[index].itemsprice} ${"62".tr}",
                                size: "L",
                                color: "Cream",
                                count: '${controller.data[index].countitems}',
                                 onAdd: () async{
                                  await controller.add(controller.data[index].itemsId!);
                                  controller.refreshPage();
                                 },
                                onRemove: () async{
                                  await controller.deleteProduct(controller.data[index].itemsId!);
                                  controller.refreshPage();
                                },
                              ),
                            ),
                          ),
                        ],
                      ))
                ],
              )),
      bottomNavigationBar: GetBuilder<CartController>(
          builder: (controller) => CustomBottomNav(
            onApplyCoupon: (){
              controller.checkCoupon();
            },
              productPrice: "${controller.priceOrders}",
              shipping: "Freeship",
              totalPrice: "${controller.getTotalPrice()}",
            controllerCoupon: controller.controllerCoupon!,
            discount: '${controller.discountCoupon}%',
            onPressedCheckOut: (){
              controller.goToCheckOut(context);
            },
          )
      ),
    );
  }
}
