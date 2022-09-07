import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_practice/app/modules/home/controllers/cart_controller.dart';
import 'package:get_practice/app/modules/home/controllers/home_section_controller.dart';
import 'package:get_practice/app/widgets/product_widget.dart';

class HomeSectionView extends GetView<HomeSectionController> {
  HomeSectionView({Key? key}) : super(key: key);
  final ScrollController _scrollController = ScrollController();
  CartController cartController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      controller: _scrollController,
      child: Obx(
        () => GridView.builder(
          controller: _scrollController,
          itemCount: controller.products.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3),
          itemBuilder: (context, index) {
            return ProductWidget(productModel: controller.products[index]);
          },
        ),
      ),
    );
  }
}
