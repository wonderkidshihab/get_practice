import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/loading_controller.dart';

class LoadingView extends GetView<LoadingController> {
  const LoadingView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<LoadingController>(
        builder: (_) => const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
