import 'package:fluent_ui/fluent_ui.dart';
import 'package:get/get.dart';

class CartItemRemoveDialog extends StatefulWidget {
  const CartItemRemoveDialog({Key? key}) : super(key: key);

  @override
  State<CartItemRemoveDialog> createState() => _CartItemRemoveDialogState();
}

class _CartItemRemoveDialogState extends State<CartItemRemoveDialog> {
  @override
  Widget build(BuildContext context) {
    return FluentApp(
      debugShowCheckedModeBanner: false,
      home: ContentDialog(
        title: const Center(child: Text('Remove Item')),
        content: const SizedBox(
          height: 20,
          child: Center(
            child: Text(
              'Are you sure you want to remove this item?',
            ),
          ),
        ),
        actions: [
          Button(
            child: const Text('Cancel'),
            onPressed: () {
              Get.back(result: false);
            },
          ),
          Button(
            style: ButtonStyle(
              backgroundColor: ButtonState.all<Color>(Colors.red),
              border: ButtonState.all<BorderSide>(BorderSide.none),
            ),
            onPressed: () {
              Get.back(result: true);
            },
            child: const Text('Delete', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }
}
