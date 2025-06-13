import "package:flutter/material.dart";
import "package:fluttertoast/fluttertoast.dart";

abstract class CustomToast {
  static showSuccessToast(String msg) {
    Fluttertoast.showToast(
      msg: msg,
      backgroundColor: Colors.green,
      toastLength: Toast.LENGTH_SHORT,
      textColor: Colors.white,
    );
  }

  static showWarningToast(String msg) {
    Fluttertoast.showToast(
      msg: msg,
      backgroundColor: Colors.yellow,
      toastLength: Toast.LENGTH_SHORT,
      textColor: Colors.black,
    );
  }

  static showErrorToast(String msg) {
    Fluttertoast.showToast(
      msg: msg,
      backgroundColor: Colors.red,
      toastLength: Toast.LENGTH_SHORT,
      textColor: Colors.white,
    );
  }
}
