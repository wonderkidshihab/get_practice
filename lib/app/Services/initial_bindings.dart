import 'package:get/get.dart';
import 'package:get_practice/app/Services/api_client.dart';
import 'package:get_practice/app/Services/shared_preference_manager.dart';

class InitialBindings extends Bindings {
  @override
  void dependencies() {
    Get.putAsync(() => ApiClient().init());
    Get.putAsync(() => SharedPreferenceManager().init());
  }
}