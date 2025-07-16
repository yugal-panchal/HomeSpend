import 'package:get/get.dart';
import 'package:home_spend/data/services/firebase_auth_service.dart';
import 'package:home_spend/routes/app_routes.dart';

class SplashController extends GetxController {
  final FirebaseAuthService _authService;
  
  SplashController(this._authService);

  @override
  void onInit() {
    super.onInit();
    print("Initializing the splash controller");
  }

  @override
  void onReady() {
    checkLoginStatus();
    super.onReady();
  }

  void checkLoginStatus() async {
    print("Checkin the login status");
    await Future.delayed(Duration(seconds: 1));
    final isLogedIn = _authService.isLogedIn();
    print("Is logged in => $isLogedIn");

    if (isLogedIn) {
      Get.offAllNamed(AppRoutes.home);
    } else {
      Get.offAllNamed(AppRoutes.login);
    }
  }
}
