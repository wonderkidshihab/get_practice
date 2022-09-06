import 'package:get/get.dart';
import 'package:get_practice/app/routes/app_pages.dart';

class LoadingController extends GetxController {

  @override
  void onInit() {
    Future.delayed(const Duration(seconds: 3), () {
      Get.offNamed(Routes.HOME);
    });
    super.onInit();
  }
}
