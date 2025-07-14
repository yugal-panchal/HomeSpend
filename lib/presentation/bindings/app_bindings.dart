import 'package:get/get.dart';
import 'package:home_spend/data/services/firebase_auth_service.dart';
import 'package:home_spend/data/services/firebase_firestore_service.dart';
import 'package:home_spend/presentation/controllers/splash_controller.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(() => FirebaseAuthService());
    Get.put(() => FirebaseFirestoreService());

    Get.lazyPut(() => SplashController(Get.find()));
  }
}
