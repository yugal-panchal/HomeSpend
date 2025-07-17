import 'package:country_phone_validator/country_phone_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:home_spend/data/models/family_member_model.dart';
import 'package:home_spend/domain/entities/family_member.dart';
import 'package:home_spend/domain/repositories/auth_repository.dart';
import 'package:home_spend/presentation/controllers/auth_controller.dart';
import 'package:home_spend/routes/app_routes.dart';
import 'package:home_spend/utils/toast.dart';

class UserAuth {
  final AuthRepository authRepository;

  UserAuth(this.authRepository);

  FamilyMemberModel tempUserData = FamilyMemberModel.emptyObject();
  bool? userRegistered;
  String? code;
  String? phoneNumber;

  void signup(FamilyMember familyMember, {String? code}) async {
    bool isValid = CountryUtils.validatePhoneNumber(familyMember.number, "+91");
    if (isValid) {
      tempUserData = FamilyMemberModel.fromEntity(familyMember);
      this.code = code;
      userRegistered = await authRepository.isUserRegistered(
        tempUserData.phoneNumber,
      );
      if (userRegistered == true) {
        CustomToast.showWarningToast("User already registered. Please login!");
      } else {
        Get.find<AuthController>().sendOtp("+91${tempUserData.phoneNumber}");
        Get.toNamed(AppRoutes.otpVerifyScreen);
      }
    } else {
      CustomToast.showErrorToast("Phone number is not valid");
    }
  }

  Future<void> sendOtp({
    required String phoneNumber,
    required Function(String verificationId) onCodeSent,
    required Function(PhoneAuthCredential credential) onAutoVerify,
    required Function(FirebaseAuthException e) onFailed,
    required Function(String verificationId) onTimeout,
  }) async {
    await authRepository.sendOtp(
      phoneNumber: phoneNumber,
      onCodeSent: onCodeSent,
      onAutoVerify: onAutoVerify,
      onFailed: onFailed,
      onTimeout: onTimeout,
    );
  }

  Future<void> verifyOtp({
    required String verificationId,
    required String smsCode,
  }) async {
    bool isVerified = await authRepository.verifyOtp(
      verificationId: verificationId,
      smsCode: smsCode,
    );
    if (isVerified) {
      CustomToast.showSuccessToast("OTP verified successfully");
      if (tempUserData == FamilyMemberModel.emptyObject()) {
        await authRepository.familyMemberLogin(phoneNumber!);
        Get.offAllNamed(AppRoutes.home);
      } else {
        FamilyMember user = await authRepository.familyMemberSignup(
          tempUserData,
          code: code,
        );
        if (user.id != "") {
          Get.offAllNamed(AppRoutes.home);
        } else {
          CustomToast.showErrorToast("Error while signing up");
          Get.offAllNamed(AppRoutes.signup);
        }
      }
    }
  }

  Future<void> signInWithCredential(PhoneAuthCredential credential) async {
    await authRepository.signInWithCredential(credential);
  }

  Future<void> login(String number) async {
    bool isValid = CountryUtils.validatePhoneNumber(number, "+91");
    if (isValid) {
      phoneNumber = number;
      Get.find<AuthController>().sendOtp("+91$number");
      Get.toNamed(AppRoutes.otpVerifyScreen);
    } else {
      CustomToast.showErrorToast("Please enter a valid number");
    }
  }
}
