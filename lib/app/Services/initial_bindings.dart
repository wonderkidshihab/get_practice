import 'package:get/get.dart';
import 'package:get_practice/app/Services/api_client.dart';
import 'package:get_practice/app/Services/shared_preference_manager.dart';
import 'package:get_practice/app/modules/Auth/controllers/auth_controller.dart';

class InitialBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(AuthController());
    Get.put(ApiClient());
    Get.put(SharedPreferenceManager());
  }
}
