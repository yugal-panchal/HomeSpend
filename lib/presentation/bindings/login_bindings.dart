import 'package:get/get.dart';
import 'package:home_spend/presentation/controllers/login_controller.dart';

class LoginBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginController(),fenix: true);
  }
}