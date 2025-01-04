import 'package:ecommerce/controller/auth/signup_controller.dart';
import 'package:ecommerce/core/class/statusrequest.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/core/constant/iconassets.dart';
import 'package:ecommerce/core/functions/alertexitapp.dart';
import 'package:ecommerce/view/widget/auth/custom_button_auth.dart';
import 'package:ecommerce/view/widget/auth/custom_social_button.dart';
import 'package:ecommerce/view/widget/auth/custom_text_form_auth.dart';
import 'package:ecommerce/view/widget/auth/custom_text_title_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../bindings/initial_bindings.dart';
import '../../../core/class/handlingdata_view.dart';
import '../../../core/functions/valid_input.dart';
import '../../widget/auth/custom_success_bottomsheet.dart';
import '../../widget/auth/text_button_auth.dart';

class SignUp extends GetView<AppBindings> {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      body: WillPopScope(
        onWillPop: alertExitApp,
        child: SafeArea(
          child: GetBuilder<SignUpControllerImp>(
              builder: (controller) =>
        HandlingDataRequest(statusRequest: controller.statusRequest, widget:
              Container(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
            child: Form(
              key: controller.formState4,
              child: ListView(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomTextTitleAuth(title: '25'.tr),
                      const SizedBox(height: 25),
                      CustomTextFormAuth(
                        hintText: '27'.tr,
                        labelText: '26'.tr,
                        prefixIcon: Icon(Icons.person_2_outlined),
                        myController: controller.name,
                        valid: (val) {
                          return validInput(val!, 8, 30, "username", "26".tr);
                        },
                      ),
                      const SizedBox(
                        height: 5,
                      ),
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
                        height: 5,
                      ),
                      CustomTextFormAuth(
                        hintText: '29'.tr,
                        labelText: '28'.tr,
                        prefixIcon: Icon(Icons.phone_android_outlined),
                        myController: controller.phone,
                        keyboardType: TextInputType.phone,
                        valid: (val) {
                          return validInput(val!, 8, 30, "phone", "28".tr);
                        },
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Obx(
                            () => CustomTextFormAuth(
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
                            return validInput(val!, 8, 30, "password", "18".tr);
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Obx(
                            () => CustomTextFormAuth(
                          hintText: "19".tr,
                          labelText: "30".tr,
                          prefixIcon: Icon(Icons.lock_outline),
                          suffixIcon: controller.isRePasswordVisible.value
                              ? Icons.visibility_off
                              : Icons.visibility,
                          obscureText: !controller.isRePasswordVisible.value,
                          onPressed: controller.toggleRePasswordVisibility,
                          myController: controller.confirmPassword,
                          valid: (val) {
                            return validInput(val!, 8, 30, "password", "18".tr, originalPassword: controller.password.text);
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: CustomButtonAuth(
                            title: "23".tr,
                            onPressed: (){
                              controller.signUp(context);
                            }
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      CustomTextButtonAuth(
                        textWithOutClick: "31".tr,
                        textWithClick: "21".tr,
                        onTap: () {
                          controller.goToLogIn();
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
          ),
        ),
      ),
      ),
    );
  }
}
