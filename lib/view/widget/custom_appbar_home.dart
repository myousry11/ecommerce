import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final VoidCallback leadingTab;
  final VoidCallback? actionTab;

  const CustomAppBar({
    super.key,
    required this.title,
    required this.leadingTab,
    required this.actionTab,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      forceMaterialTransparency: true,
      title: Text(title),
      titleTextStyle: Theme.of(context).textTheme.headlineMedium!.copyWith(fontSize: 22, fontWeight: FontWeight.w700),
      centerTitle: true,
      leading: GestureDetector(
        onTap: leadingTab,
        child: Image.asset(
          'assets/icons/menusLeft.png',
          width: 24,
          height: 24,
        ),
      ),
      actions: [
        GestureDetector(
          onTap: actionTab,
          child: Image.asset(
            'assets/icons/bell.png',
            width: 24,
            height: 24,
          ),
        ),
        const SizedBox(width: 16),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
