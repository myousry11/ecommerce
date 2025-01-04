import 'package:ecommerce/core/constant/routes.dart';
import 'package:ecommerce/view/widget/checkout/content/step%20two/custom_choose_payment.dart';
import 'package:ecommerce/view/widget/checkout/content/step%20two/custom_credit_card.dart';
import 'package:ecommerce/view/widget/checkout/content/step_one_content_checkout.dart';
import 'package:ecommerce/view/widget/checkout/content/step%20two/custom_price_payment_checkout.dart';
import 'package:ecommerce/view/widget/checkout/content/step_three_content_checkout.dart';
import 'package:ecommerce/view/widget/checkout/custom_button_nav_bar.dart';
import 'package:ecommerce/view/widget/checkout/custom_stepper_checkout.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/controller/checkout_controller.dart';
import 'package:ecommerce/core/class/handlingdata_view.dart';
import 'package:ecommerce/core/constant/color.dart';
import '../widget/cart/custom_button_cart.dart';
import '../widget/custom_appbar_sub.dart';

class CheckOut extends StatelessWidget {
  const CheckOut({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: CustomAppbarSub(
          title: "148".tr,
          onPressed: () {
            Get.offAllNamed(AppRoute.cart);
          },
        ),
      ),
      backgroundColor: AppColor.white,
      body: GetBuilder<CheckoutController>(
        builder: (controller) => Column(
          children: [
            // Stepper Row with Animation
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: CustomStepperCheckout(currentStep: controller.currentStep),
            ),
            // Content based on current step
            Expanded(
              child: ListView(
                children: [
                  if (controller.currentStep == 0) ...[
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: StepOneContentCheckout(),
                    ),
                  ],
                  if (controller.currentStep == 1) ...[
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: CustomChoosePayment(),
                    ),
                    const SizedBox(height: 15),
                    if (controller.paymentType == "1")
                      const CustomCreditCard(),
                    const CustomPricePaymentCheckout(),
                  ],
                  if (controller.currentStep == 2) ...[
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      child: StepThreeContentCheckout(),
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const CustomButtonNavBar(),
    );
  }
}