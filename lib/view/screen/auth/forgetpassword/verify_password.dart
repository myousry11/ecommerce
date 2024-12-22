import 'package:ecommerce/controller/forgetpassword/verify_password_controller.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/view/widget/auth/custom_button_auth.dart';
import 'package:ecommerce/view/widget/auth/custom_text_body_auth.dart';
import 'package:ecommerce/view/widget/auth/custom_text_title_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';

import '../../../../core/class/handlingdata_view.dart';

class VerifyPassword extends GetView<VerifyPasswordControllerImp> {
  const VerifyPassword({super.key});

  @override
  Widget build(BuildContext context) {
    VerifyPasswordControllerImp controller = Get.find();
    return Scaffold(
      appBar: AppBar(),
      body: GetBuilder<VerifyPasswordControllerImp>(
        builder: (controller) => HandlingDataRequest(
          statusRequest: controller.statusRequest,
          widget: ListView(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTextTitleAuth(title: '34'.tr),
                    const SizedBox(height: 40),
                    CustomTextBodyAuth(text: "35".tr),
                    const SizedBox(height: 60),
                    OtpTextField(
                      textStyle: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(color: AppColor.black),
                      fieldWidth: 50.0,
                      borderRadius: BorderRadius.circular(50.0),
                      numberOfFields: 5,
                      borderColor: Color(0xFFA5A7AC),
                      showFieldAsBox: true,
                      onCodeChanged: (String code) {
                        controller.checkCode(code); // تحقق من إدخال الكود
                      },
                      onSubmit: (String verificationCode) {
                        controller.checkCode(verificationCode);
                      },
                    ),
                    const SizedBox(height: 20),
                    Center(
                      child: Obx(() => GestureDetector(
                            onTap: controller.isResendActive.value
                                ? controller.resendCode
                                : null,
                            child: Text(
                              controller.isResendActive.value
                                  ? "Resend Code"
                                  : "Resend in 00:${controller.remainingTime}",
                              style: TextStyle(
                                color: controller.isResendActive.value
                                    ? Colors.black
                                    : Colors.grey,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          )),
                    ),
                    const SizedBox(height: 40),
                    Center(
                      child: Obx(() => CustomButtonAuth(
                            title: "36".tr,
                            onPressed: controller.isButtonActive.value
                                ? controller.goToReset
                                : null,
                            buttonColor: controller.isButtonActive.value
                                ? AppColor.primaryColor
                                : AppColor.grey,
                          )),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
