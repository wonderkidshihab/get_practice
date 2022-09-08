import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_practice/app/Utils/usb_helper.dart';
import 'package:get_practice/app/modules/usbdevices/views/usb_dialog.dart';
import 'package:quick_usb/quick_usb.dart';

import '../controllers/usbdevices_controller.dart';

class UsbdevicesView extends GetView<UsbdevicesController> {
  UsbdevicesView({Key? key}) : super(key: key);
  var usbHelper = Get.find<USBHelper>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<List<UsbDevice>>(
        stream: usbHelper.getDevicesStream(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              UsbDevice device = snapshot.data![index];
              return ListTile(
                title: Text("Identifier: ${device.identifier}"),
                subtitle: Text("ProductId: ${device.productId}"),
                onTap: () async {
                  await Get.dialog(USBDialog(device: device));
                  // QuickUsb.getConfiguration(index);
                  // Get.dialog(USBDialog(device: device),
                  //     barrierDismissible: true);
                },
              );
            },
          );
        },
      ),
    );
  }
}
