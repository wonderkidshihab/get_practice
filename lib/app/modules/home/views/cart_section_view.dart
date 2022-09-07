import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:get_practice/app/modules/home/controllers/cart_controller.dart';
import 'package:get_practice/app/widgets/cart_product_widget.dart';

class CartSectionView extends GetView<CartController> {
  const CartSectionView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Obx(
              () => AnimationLimiter(
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return AnimationConfiguration.staggeredList(
                      position: index,
                      duration: const Duration(milliseconds: 375),
                      child: SlideAnimation(
                        verticalOffset: 50.0,
                        child: FadeInAnimation(
                          child: CartProductWidget(
                            cartProductModel: controller.cartItems[index],
                          ),
                        ),
                      ),
                    );
                  },
                  itemCount: controller.cartItems.length,
                ),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 50),
            decoration: const BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 10,
                  offset: Offset(0, -5),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text('Total:', style: TextStyle(fontSize: 20)),
                Obx(() {
                  return Text(
                    '${controller.totalPrice.value.toStringAsFixed(2)}\$',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  );
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
