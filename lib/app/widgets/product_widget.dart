import 'package:fluent_ui/fluent_ui.dart';
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
            child: Container(
              padding: const EdgeInsets.all(20),
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey),
              ),
              child: Image.network(
                productModel.image ?? '',
                fit: BoxFit.contain,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            productModel.title ?? '',
            style: const TextStyle(fontSize: 20),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),
          Text('\$${productModel.price}'),
          const SizedBox(height: 10),
          Button(
            child: const Text("Add to cart"),
            onPressed: () {
              cartController.addItem(productModel);
            },
          ),
        ],
      ),
    );
  }
}
