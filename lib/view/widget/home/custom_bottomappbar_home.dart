import 'package:ecommerce/controller/home_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'custom_button_appbar.dart';

class CustomBottomAppBarHome extends StatelessWidget {
  const CustomBottomAppBarHome({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeScreenControllerImp>(
      builder: (controller) => ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
        child: BottomAppBar(
          height: 70,
          color: Colors.blue.withOpacity(0.1), // لون شريط التنقل السفلي
          shape: const CircularNotchedRectangle(), // شكل الشق
          notchMargin: 10, // المسافة بين الشق والزراير
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ...List.generate(
                controller.listPage.length,
                    (index) => CustomButtonAppbar(
                  image: controller.bottomAppBar[index]['icon'],
                  active: controller.currentPage == index,
                  onPressed: () {
                    controller.changePage(index);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
