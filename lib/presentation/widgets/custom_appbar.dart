import 'package:flutter/material.dart';
import 'package:home_spend/utils/styles.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  const CustomAppbar({required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title, style: regularStyle),
    );
  }
  
  @override
  Size get preferredSize => Size(double.infinity, 50);
}