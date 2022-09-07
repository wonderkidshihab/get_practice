import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_practice/app/data/Models/cart_product_model_dart.dart';
import 'package:get_practice/app/modules/home/Widgets/cart_item_remove_dialog.dart';
import 'package:get_practice/app/modules/home/controllers/cart_controller.dart';

class CartProductWidget extends StatelessWidget {
  final CartProductModel cartProductModel;
  final CartController cartController = Get.find();
  CartProductWidget({Key? key, required this.cartProductModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.network(
            cartProductModel.image ?? '',
            fit: BoxFit.cover,
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(cartProductModel.title ?? ''),
                Text(cartProductModel.price.toString()),
              ],
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {
                  cartController.decreaseQuantity(cartProductModel);
                },
                icon: const Icon(Icons.remove_circle_outline),
                iconSize: 30,
              ),
              const SizedBox(width: 10),
              Text(
                cartProductModel.quantity.toString(),
                style: const TextStyle(fontSize: 20, height: 20 / 20),
              ),
              const SizedBox(width: 10),
              IconButton(
                onPressed: () {
                  cartController.increaseQuantity(cartProductModel);
                },
                icon: const Icon(Icons.add_circle_outline),
                iconSize: 30,
              ),
            ],
          ),
          const SizedBox(width: 20),
          IconButton(
            onPressed: () async {
              var result = await Get.dialog(
                const CartItemRemoveDialog(),
                barrierDismissible: false,
              );
              if (result == true) {
                cartController.removeItem(cartProductModel);
              }
            },
            icon: const Icon(Icons.delete),
          ),
        ],
      ),
    );
  }
}
