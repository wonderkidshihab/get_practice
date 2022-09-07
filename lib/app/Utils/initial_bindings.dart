import 'package:get/get.dart';
import 'package:get_practice/app/Utils/api_client.dart';

class InitialBindings extends Bindings {
  @override
  void dependencies() {
    Get.putAsync<ApiClient>(() => ApiClient().init());
  }
}
