import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_practice/app/Services/shared_preference_manager.dart';
import 'package:get_practice/app/routes/app_pages.dart';

class AuthController extends GetxController {
  TextEditingController nameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  void register() async {
    Get.snackbar(
      'Register',
      'Registering...',
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 1),
    );
    var sharedPrefManager = Get.find<SharedPreferenceManager>();
    sharedPrefManager.setName(nameController.text);
    sharedPrefManager.setEmail(emailController.text);
    sharedPrefManager.setLoggedIn(true);
    Future.delayed(const Duration(seconds: 1), () {
      Get.offNamed(Routes.HOME);
    });
  }

  void logout() {}
}
