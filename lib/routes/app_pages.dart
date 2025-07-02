import 'package:get/route_manager.dart';
import 'package:home_spend/presentation/views/auth/login.dart';
import 'package:home_spend/routes/app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(name: AppRoutes.login, page: () => LoginScreen(), )
  ]; 
}