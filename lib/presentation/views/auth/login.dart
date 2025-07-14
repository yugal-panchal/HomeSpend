import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:home_spend/presentation/controllers/auth_controller.dart';
import 'package:home_spend/presentation/widgets/custom_appbar.dart';
import 'package:home_spend/presentation/widgets/custom_button.dart';
import 'package:home_spend/presentation/widgets/custom_dropdown.dart';
import 'package:home_spend/presentation/widgets/custom_textfield.dart';
import 'package:home_spend/utils/dimensions.dart';
import 'package:home_spend/utils/styles.dart';

class LoginScreen extends GetView<AuthController> {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(title: "Login Screen"),
      body: Obx(() {
        return Column(
          children: [
            Text(
              "Welcome to HomeSpend",
              style: boldStyle.copyWith(fontSize: 16),
            ),
            SizedBox(height: Dimensions.paddingSizeDefault),
            Text("Login", style: boldStyle.copyWith(fontSize: 16)),
            SizedBox(height: Dimensions.paddingSizeExtraLarge),
            CustomTextfield(
              title: "Phone number",
              controller: controller.phoneNumberController,
            ),
            SizedBox(height: Dimensions.paddingSizeDefault),
            CustomButton("Login", controller.signup),
          ],
        );
      }),
    );
  }
}
