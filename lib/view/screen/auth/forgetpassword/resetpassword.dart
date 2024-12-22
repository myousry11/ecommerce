import 'package:ecommerce/controller/forgetpassword/forget_password_controller.dart';
import 'package:ecommerce/controller/forgetpassword/reset_password_controller.dart';
import 'package:ecommerce/core/class/statusrequest.dart';
import 'package:ecommerce/view/widget/auth/custom_success_bottomsheet.dart';
import 'package:ecommerce/view/widget/auth/custom_button_auth.dart';
import 'package:ecommerce/view/widget/auth/custom_text_body_auth.dart';
import 'package:ecommerce/view/widget/auth/custom_text_form_auth.dart';
import 'package:ecommerce/view/widget/auth/custom_text_title_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/class/handlingdata_view.dart';
import '../../../../core/functions/valid_input.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: GetBuilder<ResetPasswordControllerImp>(
        builder: (controller) => HandlingDataRequest(
          statusRequest: controller.statusRequest,
          widget: Container(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
            child: Form(
              key: controller.formState1,
              child: ListView(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomTextTitleAuth(title: '37'.tr),
                      const SizedBox(height: 40),
                      CustomTextBodyAuth(text: "38".tr),
                      const SizedBox(height: 60),
                      Obx(() => CustomTextFormAuth(
                            hintText: "19".tr,
                            labelText: "18".tr,
                            prefixIcon: Icon(Icons.lock_outline),
                            suffixIcon: controller.isPasswordVisible.value
                                ? Icons.visibility_off
                                : Icons.visibility,
                            obscureText: !controller.isPasswordVisible.value,
                            onPressed: controller.togglePasswordVisibility,
                            myController: controller.password,
                            valid: (val) {
                              return validInput(
                                  val!, 8, 30, "password", "18".tr);
                            },
                          )),
                      const SizedBox(height: 20),
                      Obx(() => CustomTextFormAuth(
                            hintText: "19".tr,
                            labelText: "30".tr,
                            prefixIcon: Icon(Icons.lock_outline),
                            suffixIcon: controller.isRePasswordVisible.value
                                ? Icons.visibility_off
                                : Icons.visibility,
                            obscureText: !controller.isRePasswordVisible.value,
                            onPressed: controller.toggleRePasswordVisibility,
                            myController: controller.rePassword,
                            valid: (val) {
                              return validInput(
                                  val!, 8, 30, "password", "18".tr,
                                  originalPassword: controller.password.text);
                            },
                          )),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 50.0),
                        child: Center(
                          child: CustomButtonAuth(
                            title: "39".tr,
                            onPressed: () {
                              controller.onButtonSuccessReset(context);
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
