import 'dart:convert';
import 'dart:typed_data';
import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/view/widget/productdetails/custom_alert_product.dart';
import 'package:ecommerce/view/widget/productdetails/custom_bottom_nav_bar.dart';
import 'package:ecommerce/view/widget/productdetails/productcontent.dart';
import 'package:ecommerce/view/widget/productdetails/productimage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/controller/productdetails_controller.dart';

class ProductDetails extends GetView<ProductDetailsControllerImp> {
  const ProductDetails({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      body: GetBuilder<ProductDetailsControllerImp>(
        builder: (controller) => Container(
          color: Colors.blue,
          child: CustomScrollView(
            slivers: [
               SliverAppBar(
                leading: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white, // لون الخلفية
                      shape: BoxShape.circle, // تحديد الشكل كدائرة
                      boxShadow: [
                        BoxShadow(
                          color: Colors.white.withOpacity(0.4), // لون الظل
                          spreadRadius: 2,
                          blurRadius: 10,
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
                backgroundColor: Colors.transparent,
                expandedHeight: 410.0,
                floating: false,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                  background: ProductImage(),
                ),
              ),
              SliverToBoxAdapter(
                child: ProductContent(),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(
        title: "Add To Cart",
        onPressed: () {
           controller.addProduct(controller.itemsModel.itemsId!);
           //  controller.cartController.add();  مش هتتحط هنا
        },
      ),
    );
  }
}
