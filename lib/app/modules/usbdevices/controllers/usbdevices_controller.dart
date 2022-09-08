import 'package:get/get.dart';
import 'package:get_practice/app/Utils/usb_helper.dart';
import 'package:quick_usb/quick_usb.dart';

class UsbdevicesController extends GetxController {
  var devices = <UsbDevice>[].obs;

  @override
  void onInit() async {
    devices.addAll(await Get.find<USBHelper>().getDevices());
    super.onInit();
  }
}
