import 'package:get/get.dart';
import 'package:get_practice/app/Utils/api_client.dart';
import 'package:get_practice/app/Utils/usb_helper.dart';
import 'package:get_practice/app/modules/usbdevices/controllers/usbdevices_controller.dart';

class InitialBindings extends Bindings {
  @override
  void dependencies() {
    Get.putAsync<ApiClient>(() => ApiClient().init());
    Get.putAsync<USBHelper>(() => USBHelper().init());
    Get.put<UsbdevicesController>(UsbdevicesController());
  }
}
