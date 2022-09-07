import 'package:get/get.dart';
import 'package:get_practice/app/modules/home/controllers/cart_controller.dart';
import 'package:get_practice/app/modules/home/controllers/home_section_controller.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CartController>(
      () => CartController(),
    );
    Get.lazyPut<HomeSectionController>(
      () => HomeSectionController(),
    );
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
  }
}
