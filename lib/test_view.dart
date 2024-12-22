// import 'package:ecommerce/controller/auth/test_controller.dart';
// import 'package:ecommerce/core/class/handlingdata_view.dart';
// import 'package:ecommerce/core/class/statusrequest.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// class TestView extends StatelessWidget {
//   const TestView({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: GetBuilder<TestController>(
//         init: Get.find<TestController>(), // تهيئة TestController إذا لم يكن موجودًا
//         builder: (controller) {
//           return HandlingDataView(statusRequest: controller.statusRequest, widget: ListView.builder(
//             itemCount: controller.data.length,
//             itemBuilder: (context, index) {
//               return Text("${controller.data[index]}");
//             },
//           )
//           );
//         },
//       ),
//     );
//   }
// }
