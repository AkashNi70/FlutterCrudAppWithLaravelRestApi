import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../repositories/auth_repository.dart';

class AuthController extends GetxController {
  var isAuthenticated = false.obs;
  final AuthRepository repository;

  AuthController({required this.repository});

  @override
  void onInit() {
    super.onInit();
    checkAuthentication();
  }

  Future<void> checkAuthentication() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    isAuthenticated.value = prefs.getString('token') != null;
  }

  Future<void> login(String email, String password) async {
    try {
      await repository.login(email, password);
      isAuthenticated.value = true;
      Get.offAllNamed('/home');
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }

  Future<void> signUp(String name,String email, String password) async {
    try {
      await repository.signUp(name,email, password);
      isAuthenticated.value = true;
      Get.offAllNamed('/home');
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }

  Future<void> logout() async {
    await repository.logout();
    isAuthenticated.value = false;
    Get.offAllNamed('/login');
  }
}
