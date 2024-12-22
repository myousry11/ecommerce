import 'package:ecommerce/controller/auth/login_controller.dart';
import 'package:ecommerce/core/class/handlingdata_view.dart';
import 'package:ecommerce/core/class/statusrequest.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/core/constant/iconassets.dart';
import 'package:ecommerce/core/functions/alertexitapp.dart';
import 'package:ecommerce/core/functions/valid_input.dart';
import 'package:ecommerce/view/widget/auth/custom_button_auth.dart';
import 'package:ecommerce/view/widget/auth/custom_social_button.dart';
import 'package:ecommerce/view/widget/auth/custom_text_form_auth.dart';
import 'package:ecommerce/view/widget/auth/custom_text_title_auth.dart';
import 'package:ecommerce/view/widget/auth/text_button_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

      ),
      body: WillPopScope(
                    onWillPop: alertExitApp,
                    child: GetBuilder<LoginControllerImp>(builder: (controller) =>
                    HandlingDataRequest(statusRequest: controller.statusRequest, widget:
                        Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 40, horizontal: 30),
                      child: Form(
                        key: controller.formState3,
                        child: ListView(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomTextTitleAuth(title: '15'.tr),
                                const SizedBox(height: 100),
                                CustomTextFormAuth(
                                  hintText: '17'.tr,
                                  labelText: '16'.tr,
                                  prefixIcon: Icon(Icons.email_outlined),
                                  myController: controller.email,
                                  valid: (val) {
                                    return validInput(
                                        val!, 5, 50, "email", "16".tr);
                                  },
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Obx(
                                      () => CustomTextFormAuth(
                                    hintText: "19".tr,
                                    labelText: "18".tr,
                                    prefixIcon: Icon(Icons.lock_outline),
                                    suffixIcon:
                                    controller.isPasswordVisible.value
                                        ? Icons.visibility_off
                                        : Icons.visibility,
                                    obscureText:
                                    !controller.isPasswordVisible.value,
                                    onPressed:
                                    controller.togglePasswordVisibility,
                                    myController: controller.password,
                                    valid: (val) {
                                      return validInput(
                                          val!, 8, 30, "password", "18".tr);
                                    },
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.topRight,
                                  child: InkWell(
                                    highlightColor: Colors.transparent,
                                    splashColor: Colors.transparent,
                                    child: Text(
                                      "20".tr,
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineSmall!
                                          .copyWith(
                                        color: AppColor.grey,
                                      ),
                                    ),
                                    onTap: () {
                                      controller.goToForgetPassword();
                                    },
                                  ),
                                ),
                                const SizedBox(
                                  height: 40,
                                ),
                                Align(
                                  alignment: Alignment.bottomCenter,
                                  child: CustomButtonAuth(
                                    title: "21".tr,
                                    onPressed: () {
                                      controller.login();
                                    },
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                CustomTextButtonAuth(
                                  textWithOutClick: "22".tr,
                                  textWithClick: "23".tr,
                                  onTap: () {
                                    controller.goToSignUp();
                                  },
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Text(
                                    "24".tr,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge!
                                        .copyWith(
                                      color: AppColor.black,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  textDirection: TextDirection.ltr,
                                  children: [
                                    CustomSocialButton(
                                      image: AppIconAsset.apple,
                                      onTap: () {},
                                    ),
                                    const SizedBox(width: 20),
                                    CustomSocialButton(
                                      image: AppIconAsset.gmail,
                                      onTap: () {
                                        controller.onGoogleLogin();
                                      },
                                    ),
                                    const SizedBox(width: 20),
                                    CustomSocialButton(
                                      image: AppIconAsset.facebook,
                                      height: 30,
                                      onTap: () {},
                                    ),
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    )
                ),
              ),
      ),
    );
  }
}
