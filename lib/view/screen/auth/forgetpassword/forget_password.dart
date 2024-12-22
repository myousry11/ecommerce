import 'package:ecommerce/controller/forgetpassword/forget_password_controller.dart';
import 'package:ecommerce/core/class/statusrequest.dart';
import 'package:ecommerce/view/widget/auth/custom_button_auth.dart';
import 'package:ecommerce/view/widget/auth/custom_text_body_auth.dart';
import 'package:ecommerce/view/widget/auth/custom_text_form_auth.dart';
import 'package:ecommerce/view/widget/auth/custom_text_title_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../bindings/initial_bindings.dart';
import '../../../../core/class/handlingdata_view.dart';
import '../../../../core/functions/valid_input.dart';

class ForgetPassword extends GetView<AppBindings> {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: GetBuilder<ForgetPasswordControllerImp>(
        builder: (controller) => HandlingDataRequest(
            statusRequest: controller.statusRequest,
            widget: Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
              child: Form(
                key: controller.formState2,
                child: ListView(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomTextTitleAuth(title: '20'.tr),
                        const SizedBox(height: 40),
                        CustomTextBodyAuth(text: "32".tr),
                        const SizedBox(height: 60),
                        CustomTextFormAuth(
                          hintText: '17'.tr,
                          labelText: '16'.tr,
                          prefixIcon: Icon(Icons.email_outlined),
                          myController: controller.email,
                          valid: (val) {
                            return validInput(val!, 5, 50, "email", "16".tr);
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 80.0),
                          child: Center(
                            child: CustomButtonAuth(
                              title: "33".tr,
                              onPressed: () {
                                controller.checkEmail();
                              },
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            )),
      ),
    );
  }
}
