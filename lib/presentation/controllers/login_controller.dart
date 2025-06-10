import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController codeController = TextEditingController();


  void signup({required String name, required String role, String? code}) {
    
  }

  @override
  void onClose() {
    nameController.dispose();
    super.onClose();
  }
}