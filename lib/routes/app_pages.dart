import 'package:get/route_manager.dart';
import 'package:home_spend/presentation/bindings/auth_bindings.dart';
import 'package:home_spend/presentation/views/auth/login.dart';
import 'package:home_spend/presentation/views/auth/otp_verification.dart';
import 'package:home_spend/presentation/views/auth/signup.dart';
import 'package:home_spend/presentation/views/home.dart';
import 'package:home_spend/presentation/views/splash_screen.dart';
import 'package:home_spend/routes/app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(name: AppRoutes.splash, page: () => SplashScreen()),
    GetPage(
      name: AppRoutes.login,
      page: () => LoginScreen(),
      binding: AuthBindings(),
    ),
    GetPage(
      name: AppRoutes.signup,
      page: () => Signup(),
      binding: AuthBindings(),
    ),
    GetPage(name: AppRoutes.home, page: () => HomeScreen()),
    GetPage(name: AppRoutes.otpVerifyScreen, page: () => OtpVerification()),
  ];
}
