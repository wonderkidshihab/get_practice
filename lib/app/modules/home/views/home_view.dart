import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_practice/app/modules/Auth/controllers/auth_controller.dart';
import 'package:get_practice/app/routes/app_pages.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  HomeView({Key? key}) : super(key: key);
  AuthController authController = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeView'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const SizedBox(height: 20.0),
          Text('Welcome ${authController.nameController.text}'),
          const SizedBox(height: 20.0),
          ElevatedButton(
            onPressed: () {
              Get.toNamed(Routes.DETAILS);
            },
            child: const Text('Details'),
          ),
        ],
      ),
    );
  }
}
