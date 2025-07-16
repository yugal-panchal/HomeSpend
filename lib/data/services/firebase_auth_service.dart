import 'package:firebase_auth/firebase_auth.dart';
import 'package:home_spend/utils/toast.dart';

class FirebaseAuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> verifyPhoneNumber({
    required String phoneNumber,
    required Function(String verificationId) onCodeSent,
    required Function(PhoneAuthCredential credential) onAutoVerify,
    required Function(FirebaseAuthException e) onFailed,
    required Function(String verificationId) onTimeout,
  }) async {
    await _auth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      timeout: const Duration(seconds: 60),
      verificationCompleted: onAutoVerify,
      verificationFailed: onFailed,
      codeSent: (String verificationId, int? resendToken) {
        onCodeSent(verificationId);
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        onTimeout(verificationId);
      },
    );
  }

  Future<bool> signInWithOtp({
    required String verificationId,
    required String smsCode,
  }) async {
    try {
      final credential = PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: smsCode,
      );
      // UserCredential userCredential =
      await _auth.signInWithCredential(credential);
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case "invalid-verification-code":
          CustomToast.showErrorToast("Invalid Opt");
          return false;
        case "session-expired":
          CustomToast.showErrorToast("Otp session expired.");
          return false;
      }
    } catch (e) {
      print("Getting error while sigin through OPT");
      return false;
    }
    return true;
  }

  Future<void> signInWithCredential(PhoneAuthCredential credential) async {
    await _auth.signInWithCredential(credential);
  }

  bool isLogedIn() {
    final user = _auth.currentUser;
    if (user != null) {
      return true;
    }
    return false;
  }
}
