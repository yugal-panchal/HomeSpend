import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_spend/presentation/bindings/auth_bindings.dart';
import 'package:home_spend/routes/app_pages.dart';
import 'package:home_spend/routes/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Home Spend',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      initialBinding: AuthBindings(),
      initialRoute: AppRoutes.login,
      getPages: AppPages.pages,
    );
  }
}