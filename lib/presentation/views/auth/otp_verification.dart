import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:home_spend/presentation/controllers/auth_controller.dart';
import 'package:home_spend/presentation/widgets/custom_appbar.dart';

class OtpVerification extends StatelessWidget {
  const OtpVerification({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(title: "Verify Number"),
      body: Column(
        children: [
          OtpTextField(
            numberOfFields: 6,
            borderColor: Color(0xFF512DA8),
            showFieldAsBox: true,
            onCodeChanged: (String code) {
              //handle validation or checks here
            },
            onSubmit: (String verificationCode) {
              Get.find<AuthController>().verifyOtp(verificationCode);
            }, // end onSubmit
          ),
        ],
      ),
    );
  }
}
