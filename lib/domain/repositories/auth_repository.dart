import 'package:firebase_auth/firebase_auth.dart';
import 'package:home_spend/data/models/family_member_model.dart';
import 'package:home_spend/domain/entities/family_member.dart';

abstract class AuthRepository {
  Future<FamilyMember> familiMemberLogin();
  Future<FamilyMember> familyMemberSignup(FamilyMemberModel data, {String? code});
  
  Future<void> sendOtp({
    required String phoneNumber,
    required Function(String verificationId) onCodeSent,
    required Function(PhoneAuthCredential credential) onAutoVerify,
    required Function(FirebaseAuthException e) onFailed,
    required Function(String verificationId) onTimeout,
  });

  Future<void> verifyOtp({
    required String verificationId,
    required String smsCode,
  });

  Future<void> signInWithCredential(PhoneAuthCredential credential);
}