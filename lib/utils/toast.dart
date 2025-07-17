import "package:flutter/material.dart";
import "package:get/get.dart";

abstract class CustomToast {
  static showSuccessToast(String msg) {
    Get.snackbar("Success", msg, colorText: Colors.white,
      backgroundColor: Colors.green,
      snackPosition: SnackPosition.BOTTOM,
      duration: Duration(seconds: 1),);
  }

  static showWarningToast(String msg) {
    Get.snackbar("Warning", msg, colorText: Colors.white,
      backgroundColor: Colors.yellow,
      snackPosition: SnackPosition.BOTTOM,
      duration: Duration(seconds: 1),);
  }

  static showErrorToast(String msg) {
    Get.snackbar("Error", msg, colorText: Colors.white,
      backgroundColor: Colors.red,
      snackPosition: SnackPosition.BOTTOM,
      duration: Duration(seconds: 1),);
  }
}
