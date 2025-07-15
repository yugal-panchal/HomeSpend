import 'package:get/get.dart';
import 'package:home_spend/data/repositories/auth_repository_impl.dart';
import 'package:home_spend/domain/use_cases/auth/user_auth.dart';
import 'package:home_spend/presentation/controllers/auth_controller.dart';

class AuthBindings extends Bindings {
  @override
  void dependencies() {
    try {
      Get.put(AuthRepositoryImpl(Get.find(), Get.find()));
      
      Get.put(UserAuth(Get.find<AuthRepositoryImpl>()));
      
      Get.put(AuthController(Get.find()));
    } catch(e) {
      print("Getting error while initialising the controller $e");
    }
  }
}
