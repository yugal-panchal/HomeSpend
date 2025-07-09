import 'package:get/get.dart';
import 'package:home_spend/data/repositories/auth_repository_impl.dart';
import 'package:home_spend/domain/use_cases/auth/user_auth.dart';
import 'package:home_spend/presentation/controllers/auth_controller.dart';

class AuthBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthRepositoryImpl(Get.find(), Get.find()));
    
    Get.lazyPut(() => UserAuth(Get.find()));
    
    Get.lazyPut(() => AuthController(Get.find()));
  }
}
