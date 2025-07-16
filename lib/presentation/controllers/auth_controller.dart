import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:home_spend/domain/entities/family_member.dart';
import 'package:home_spend/domain/use_cases/auth/user_auth.dart';
import 'package:home_spend/routes/app_routes.dart';
import 'package:home_spend/utils/toast.dart';

class AuthController extends GetxController {
  final UserAuth userAuthUseCases;

  AuthController(this.userAuthUseCases);

  TextEditingController nameController = TextEditingController();
  TextEditingController codeController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();

  Rx<FamilyMemberRole> selectedRole = Rx<FamilyMemberRole>(
    FamilyMemberRole(0, ""),
  );
  var isOtpSent = false.obs;
  var isLoading = false.obs;
  String? _verificationId;

  final List<FamilyMemberRole> roles = [
    FamilyMemberRole(1, "Head"),
    FamilyMemberRole(2, "Earning Member"),
    FamilyMemberRole(3, "Member"),
  ];

  void sendOtp(String phoneNumber) async {
    isLoading.value = true;

    await userAuthUseCases.sendOtp(
      phoneNumber: phoneNumber,
      onCodeSent: (verificationId) {
        _verificationId = verificationId;
        isOtpSent.value = true;
        isLoading.value = false;
      },
      onAutoVerify: (credential) async {
        await userAuthUseCases.signInWithCredential(credential);
        isLoading.value = false;
        Get.offAllNamed(AppRoutes.home);
      },
      onFailed: (e) {
        isLoading.value = false;
        CustomToast.showErrorToast(e.message ?? 'Verification failed');
      },
      onTimeout: (verificationId) {
        _verificationId = verificationId;
        isLoading.value = false;
      },
    );
  }

  void verifyOtp(String otp) async {
    if (_verificationId == null) {
      Get.snackbar("Error", "Verification ID not found.");
      return;
    }

    try {
      isLoading.value = true;
      await userAuthUseCases.verifyOtp(
        verificationId: _verificationId!,
        smsCode: otp,
      );
      isLoading.value = false;
      // Get.offAllNamed('/home');
    } catch (e) {
      isLoading.value = false;
      Get.snackbar("Error", "Invalid OTP. Please try again.");
    }
  }

  void updateRoleSelection(String? roleTitle) {
    if (roleTitle != null) {
      FamilyMemberRole? role = roles.firstWhereOrNull(
        (role) => role.title == roleTitle,
      );
      if (role != null) {
        selectedRole.value = role;
      }
    }
  }

  void signup() {
    if (nameController.text == "") {
      CustomToast.showWarningToast("Please enter your name");
      return;
    }
    if (selectedRole.value.id == 0) {
      CustomToast.showWarningToast("Please select a role");
      return;
    }
    if(phoneNumberController.text == "") {
      CustomToast.showWarningToast("Please enter your number");
      return;
    }

    FamilyMember familyMember = FamilyMember(
      "",
      nameController.text,
      selectedRole.value,
      phoneNumberController.text,
      code: codeController.text,
    );

    userAuthUseCases.signup(familyMember);
  }

  void login() {
    if (phoneNumberController.text == "") {
      CustomToast.showWarningToast("Please enter you number");
      return;
    }

    userAuthUseCases.login(phoneNumberController.text);
  }

  @override
  void onClose() {
    nameController.dispose();
    super.onClose();
  }
}
