import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'views/auth/login_screen.dart';
import 'views/auth/sign_up_screen.dart';
import 'views/home/item_list_screen.dart';
import 'views/splash_screen.dart';
import 'controllers/auth_controller.dart';
import 'repositories/auth_repository.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final AuthController authController = Get.put(AuthController(repository: AuthRepository()));

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false   ,
      title: 'Flutter CRUD with Laravel',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => SplashScreen()),
        GetPage(name: '/login', page: () => LoginScreen()),
        GetPage(name: '/signup', page: () => SignUpScreen()),
        GetPage(name: '/home', page: () => ItemListScreen()),
      ],
    );
  }
}
