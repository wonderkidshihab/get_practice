import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    print(controller.toString());
    return const Scaffold(
      body: Center(
        child: SpinKitChasingDots(
          color: Colors.blue,
          size: 50.0,
        ),
      ),
    );
  }
}
