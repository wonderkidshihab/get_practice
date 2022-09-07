import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_practice/app/Utils/initial_bindings.dart';

import 'app/routes/app_pages.dart';

void main() {
  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      debugShowCheckedModeBanner: false,
      initialBinding: InitialBindings(),
    ),
  );
}
