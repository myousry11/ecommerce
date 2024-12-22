import 'package:flutter/material.dart';
class CustomProfileItems extends StatelessWidget {
  final String image;
  final String title;
  final Function function;
  const CustomProfileItems({super.key, required this.image, required this.title, required this.function});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Image.asset(image, height: 25,width: 40,),
            const SizedBox(
              width: 16.0,
            ),
            Text(
              title, // Use the `title` variable here, not a string literal 'title'
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
        IconButton(
          icon: Icon(
            Icons.arrow_forward_ios,
            color: Theme.of(context).primaryColor,
            size: 16.0,
          ),
          onPressed: () {
            function();
          },
        ),
      ],
    );
  }
}
