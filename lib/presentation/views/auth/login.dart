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
        print("Controller val ${controller.selectedRole.value.id}");
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
              title: "Name",
              controller: controller.nameController,
            ),
            SizedBox(height: Dimensions.paddingSizeDefault),
            CustomDropdown(
              title: "Role",
              onSelect: controller.updateRoleSelection,
              options: controller.roles.map((role) => role.title).toList(),
              selectedValue: controller.selectedRole.value.title,
            ),
            if (controller.selectedRole.value.id != 0 && controller.selectedRole.value.id != 1)
              CustomTextfield(
                title: "Code",
                controller: controller.codeController,
              ),
            CustomButton("Login", controller.signup),
          ],
        );
      }),
    );
  }
}
