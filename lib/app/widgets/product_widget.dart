import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_practice/app/data/Models/product_model.dart';
import 'package:get_practice/app/modules/home/controllers/cart_controller.dart';

class ProductWidget extends StatelessWidget {
  final ProductModel productModel;
  final CartController cartController = Get.find();
  ProductWidget({super.key, required this.productModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Expanded(
            child: Image.network(
              productModel.image ?? '',
              fit: BoxFit.cover,
            ),
          ),
          Text(productModel.title ?? ''),
          Text(productModel.price.toString()),
          ElevatedButton(
            onPressed: () {
              cartController.addItem(productModel);
            },
            child: const Text('Add to cart'),
          ),
        ],
      ),
    );
  }
}
