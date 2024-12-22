import 'package:flutter/material.dart';

class CustomButtonLang extends StatelessWidget {
  final String title;
  final String image;
  final void Function()? onTap;
  const CustomButtonLang({super.key, required this.title, required this.image, this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading:  Image(
        image: AssetImage(image),
        height: 50,
        width: 50,
      ),
      title: Text(title, style: Theme.of(context).textTheme.headlineSmall,),
      onTap: onTap,
    );
  }
}
