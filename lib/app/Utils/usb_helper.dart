import 'dart:developer';
import 'dart:typed_data';

import 'package:get/get.dart';
import 'package:libserialport/libserialport.dart';
import 'package:quick_usb/quick_usb.dart';

class USBHelper extends GetxService {
  Future<USBHelper> init() async {
    await QuickUsb.init();
    return this;
  }

  Future<List<UsbDevice>> getDevices() async {
    return await QuickUsb.getDeviceList();
  }

  Stream<List<UsbDevice>> getDevicesStream() async* {
    while (true) {
      yield await QuickUsb.getDeviceList();
      await Future.delayed(const Duration(seconds: 1));
    }
  }

  Stream<Uint8List> getDataStream(UsbDevice device) {
    return Stream.periodic(const Duration(seconds: 1), (x) => x)
        .asyncMap((event) async {
      var port = SerialPort(SerialPort.availablePorts.first);
      var usbDescription = await QuickUsb.getDeviceDescription(device);
      log(usbDescription.product.toString(), name: 'USBHelper');
      port.openReadWrite();
      port.write(Uint8List.fromList("Shihab"
          .codeUnits
          .map((e) => e.toUnsigned(8))
          .toList(growable: false)));
      var data = port.read(8);
      port.close();
      return data;
    });
  }
}
