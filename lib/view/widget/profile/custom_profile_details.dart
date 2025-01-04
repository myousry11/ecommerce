import 'package:ecommerce/controller/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class CustomProfileDetails extends GetView<ProfileControllerImp> {
  final String name;
  final String email;
  final void Function()? onPressed;

  const CustomProfileDetails({
    super.key,
    required this.name,
    required this.email,
    this.onPressed, // يجب أن يكون جزءًا من قائمة المعاملات المسماة
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundColor: Colors.grey.shade200,
            radius: 30, // التحكم بحجم الصورة
            child: const Icon(Icons.person, color: Colors.black, size: 40),
          ),
          const SizedBox(width: 15), // المسافة بين الصورة والنص
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                Text(
                  email,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: onPressed,
            icon: Image.asset('assets/icons/settings.png', height: 25,),
          ),
        ],
      ),
    );
  }
}
