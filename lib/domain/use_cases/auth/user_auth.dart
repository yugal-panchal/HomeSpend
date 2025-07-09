import 'package:firebase_auth/firebase_auth.dart';
import 'package:home_spend/data/models/family_member_model.dart';
import 'package:home_spend/domain/entities/family_member.dart';
import 'package:home_spend/domain/repositories/auth_repository.dart';

class UserAuth {
  final AuthRepository authRepository;

  UserAuth(this.authRepository);

  void signup(FamilyMember familyMember, {String? code}) async {
    FamilyMemberModel userData = FamilyMemberModel.fromEntity(familyMember);
    authRepository.familyMemberSignup(userData,code: code);
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
    await authRepository.verifyOtp(
      verificationId: verificationId,
      smsCode: smsCode,
    );
  }

  Future<void> signInWithCredential(PhoneAuthCredential credential) async {
    await authRepository.signInWithCredential(credential);
  }
}