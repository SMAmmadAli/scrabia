import 'package:flutter/material.dart';
import 'package:scrabia/Widgets/back_widget.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({super.key, required this.title, this.showBack = true});

  final String title;
  final bool showBack;

  @override
  Size get preferredSize => const Size.fromHeight(50);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: showBack
          ? Padding(padding: const EdgeInsets.all(8.0), child: BackWidget())
          : SizedBox(),
      title: Text(title),
      centerTitle: true,
    );
  }
}
