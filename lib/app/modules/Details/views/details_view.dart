import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_practice/app/Services/shared_preference_manager.dart';
import 'package:get_practice/app/modules/Auth/controllers/auth_controller.dart';

import '../controllers/details_controller.dart';

class DetailsView extends GetView<DetailsController> {
  DetailsView({Key? key}) : super(key: key);
  AuthController authController = Get.find<AuthController>();
  SharedPreferenceManager sharedPrefManager =
      Get.find<SharedPreferenceManager>();
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
          Text('Name: ${sharedPrefManager.getName()}'),
          const SizedBox(height: 20.0),
          Text('Email: ${sharedPrefManager.getEmail()}'),
          const SizedBox(height: 20.0),
        ],
      ),
    );
  }
}
