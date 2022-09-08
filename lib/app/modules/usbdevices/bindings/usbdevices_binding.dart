import 'package:get/get.dart';

import '../controllers/usbdevices_controller.dart';

class UsbdevicesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UsbdevicesController>(
      () => UsbdevicesController(),
    );
  }
}
