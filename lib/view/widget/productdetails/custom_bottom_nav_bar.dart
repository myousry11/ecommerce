import 'package:flutter/material.dart';
class CustomBottomNavBar extends StatelessWidget {
  final String title;
  final void Function()? onPressed;
  const CustomBottomNavBar({super.key, required this.title, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10.0,
            spreadRadius: 5.0,
          ),
        ],
      ),
      child: MaterialButton(
        minWidth: double.infinity,
        color: Colors.black,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30)),
        ),
        onPressed: onPressed,
        child: Text(
          title,
          style: const TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
    );
  }
}
