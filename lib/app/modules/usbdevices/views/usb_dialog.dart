import 'dart:typed_data';

import 'package:fluent_ui/fluent_ui.dart';
import 'package:get/get.dart';
import 'package:get_practice/app/Utils/usb_helper.dart';
import 'package:quick_usb/src/common.dart';

class USBDialog extends StatefulWidget {
  final UsbDevice device;
  const USBDialog({Key? key, required this.device}) : super(key: key);

  @override
  State<USBDialog> createState() => _USBDialogState();
}

class _USBDialogState extends State<USBDialog> {
  var usbHelper = Get.find<USBHelper>();
  @override
  Widget build(BuildContext context) {
    return FluentApp(
      home: ContentDialog(
        title: Text('USB Device ${widget.device.identifier}'),
        content: SizedBox(
          height: 200,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Vendor ID: ${widget.device.vendorId}'),
              Text('Product ID: ${widget.device.productId}'),
              Text('Identifier: ${widget.device.identifier}'),
              StreamBuilder<Uint8List>(
                stream: usbHelper.getDataStream(widget.device),
                builder: (context, snapshot) {
                  return Text('Device Status: ${snapshot.data}');
                },
              ),
            ],
          ),
        ),
        actions: [
          Button(
            child: const Text('Cancel'),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          Button(
            style: ButtonStyle(
              backgroundColor: ButtonState.all<Color>(Colors.red),
              border: ButtonState.all<BorderSide>(BorderSide.none),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Delete', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }
}
