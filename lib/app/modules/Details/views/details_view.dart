import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_practice/app/modules/Auth/controllers/auth_controller.dart';

import '../controllers/details_controller.dart';

class DetailsView extends GetView<DetailsController> {
  DetailsView({Key? key}) : super(key: key);
  AuthController authController = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DetailsView'),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 20.0),
          Text('Name: ${authController.nameController.text}'),
          const SizedBox(height: 20.0),
          Text('Email: ${authController.emailController.text}'),
          const SizedBox(height: 20.0),
        ],
      ),
    );
  }
}
