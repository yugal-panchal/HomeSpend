import 'package:get/get.dart';
import 'package:home_spend/presentation/controllers/auth_controller.dart';

class AuthBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthController(),fenix: true);
  }
}