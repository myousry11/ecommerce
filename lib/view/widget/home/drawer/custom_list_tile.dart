import 'package:flutter/material.dart';
class CustomListTile extends StatelessWidget {
  final String image;
  final String title;
  final void Function()? onTap;

  const CustomListTile(
      {super.key,
        required this.image,
        required this.title,
        required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset(
        image,
        height: 20,
      ),
      title: Text(
        title,
        style: Theme.of(context).textTheme.bodyMedium,
      ),
      onTap: onTap,
    );
  }
}