import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:home_spend/presentation/controllers/auth_controller.dart';
import 'package:home_spend/presentation/widgets/custom_appbar.dart';
import 'package:home_spend/presentation/widgets/custom_button.dart';
import 'package:home_spend/presentation/widgets/custom_textfield.dart';
import 'package:home_spend/routes/app_routes.dart';
import 'package:home_spend/utils/dimensions.dart';
import 'package:home_spend/utils/styles.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(title: "Login Screen"),
      body: GetBuilder<AuthController>(
        builder: (controller) {
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
              CustomButton("Login", controller.login),
              SizedBox(height: Dimensions.paddingSizeDefault),
              Row(
                children: [
                  Text("Don't have account?"),
                  SizedBox(width: Dimensions.paddingSizeExtraSmall),
                  CustomButton("Signup", () {
                    Get.toNamed(AppRoutes.signup);
                  }),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
