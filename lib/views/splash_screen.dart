import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/auth_controller.dart';
import 'auth/login_screen.dart';
import 'home/item_list_screen.dart';

class SplashScreen extends StatelessWidget {
  final AuthController authController = Get.find<AuthController>();

  SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    authController.checkAuthentication();
    return Scaffold(
      body: Center(
        child: Obx(() {
          if (authController.isAuthenticated.value) {
            return ItemListScreen();
          } else {
            return LoginScreen();
          }
        }),
      ),
    );
  }
}
