import 'package:ecommerce/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomSearchTextFormField extends StatelessWidget {
  final void Function(String)? onChanged;
  final TextEditingController textController;

  const CustomSearchTextFormField({super.key, this.onChanged, required this.textController});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1), // لون الظل خفيف
            spreadRadius: 1,
            blurRadius: 6,
            offset: const Offset(0, 3), // موقع الظل
          ),
        ],
        borderRadius: BorderRadius.circular(30), // تعديل الحواف ليكون أكثر دائرية
      ),
      child: TextFormField(
        onChanged: onChanged,
        controller: textController,
        style: Theme.of(context).textTheme.bodyMedium,
        decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.search,
            color: Colors.grey[600], // لون أيقونة البحث
            size: 24,
          ),
          hintText: "74".tr,
          hintStyle: Theme.of(context)
              .textTheme
              .bodyMedium!
              .copyWith(color: Colors.grey[500]),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(30),
          ),
          filled: true,
          fillColor: Colors.white, // لون الخلفية أبيض
          contentPadding: const EdgeInsets.symmetric(vertical: 15),
        ),
      ),
    );
  }
}
