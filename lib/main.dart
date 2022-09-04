import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_practice/app/modules/Auth/bindings/auth_binding.dart';

import 'app/routes/app_pages.dart';

void main() {
  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.INITIAL,
      initialBinding: AuthBinding(),
      getPages: AppPages.routes,
    ),
  );
}
