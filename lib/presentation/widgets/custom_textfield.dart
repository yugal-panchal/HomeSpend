import 'package:flutter/material.dart';
import 'package:home_spend/utils/dimensions.dart';
import 'package:home_spend/utils/styles.dart';

class CustomTextfield extends StatelessWidget {
  final String title;
  final TextEditingController controller;
  const CustomTextfield({required this.title,required this.controller, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(title, style: mediumStyle),
        SizedBox(height: Dimensions.paddingSizeSmall),
        TextField(
          controller: controller,
        ),
      ],
    );
  }
}
