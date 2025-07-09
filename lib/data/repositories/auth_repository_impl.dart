import 'package:firebase_auth/firebase_auth.dart';
import 'package:home_spend/data/models/family_member_model.dart';
import 'package:home_spend/data/models/family_model.dart';
import 'package:home_spend/data/models/response_model.dart';
import 'package:home_spend/data/services/firebase_auth_service.dart';
import 'package:home_spend/data/services/firebase_firestore_service.dart';
import 'package:home_spend/domain/entities/family_member.dart';
import 'package:home_spend/domain/repositories/auth_repository.dart';
import 'package:home_spend/utils/helper_functions.dart';

class AuthRepositoryImpl extends AuthRepository {

    final FirebaseAuthService _authService;
    final FirebaseFirestoreService _firestoreService; 

  AuthRepositoryImpl(this._authService, this._firestoreService);
  
  @override
  Future<FamilyMember> familiMemberLogin() {
    // TODO: implement familiMemberLogin
    throw UnimplementedError();
  }

  @override
  Future<void> sendOtp({
    required String phoneNumber,
    required Function(String verificationId) onCodeSent,
    required Function(PhoneAuthCredential credential) onAutoVerify,
    required Function(FirebaseAuthException e) onFailed,
    required Function(String verificationId) onTimeout,
  }) async {
    await _authService.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      onCodeSent: onCodeSent,
      onAutoVerify: onAutoVerify,
      onFailed: onFailed,
      onTimeout: onTimeout,
    );
  }

  @override
  Future<void> verifyOtp({
    required String verificationId,
    required String smsCode,
  }) async {
    await _authService.signInWithOtp(
      verificationId: verificationId,
      smsCode: smsCode,
    );
  }

  @override
  Future<void> signInWithCredential(PhoneAuthCredential credential) async {
    await _authService.signInWithCredential(credential);
  }

  @override
  Future<FamilyMember> familyMemberSignup(
    FamilyMemberModel userData, {
    String? code,
  }) async {
    try {
      print("User Data => $userData");
      FamilyModel familyModel = FamilyModel(
        id: "",
        name: userData.roleId == 1 ? "${userData.name}'s Family" : "",
        code: "",
        createdAt: 0,
        updatedAt: 0,
      );
      if (code != null) {
        familyModel.copyWith(code: code);
      } else {
        String code = HelperFunctions.generateRandomCode(6);
        familyModel.copyWith(code: code);
      }
      ResponseModel responseModel = await _firestoreService.userSignup(
        userData,
        familyModel,
      );
      print("Doc Path ${responseModel.toMap()}");
    } catch (e) {
      print("Error while signing up: $e");
    }
    return FamilyMember("0", "name", FamilyMemberRole(1, "title"));
  }
}
