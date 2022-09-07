import 'package:get/get.dart';
import 'package:get_practice/app/data/Models/cart_product_model_dart.dart';
import 'package:get_practice/app/data/Models/product_model.dart';

class CartController extends GetxController {
  var cartItems = <CartProductModel>[].obs;

  RxDouble totalPrice = 0.0.obs;

  void addItem(ProductModel productModel) {
    if (!cartItems.any((element) => element.id == productModel.id)) {
      cartItems.add(CartProductModel.fromProductModel(productModel));
    }
  }

  void removeItem(CartProductModel productModel) {
    cartItems.remove(productModel);
  }

  void clearCart() {
    cartItems.clear();
  }

  @override
  void onInit() {
    cartItems.listen((p0) {
      totalPrice.value = 0.0;
      for (var element in cartItems) {
        totalPrice.value += element.price! * element.quantity;
      }
    });
    super.onInit();
  }

  void decreaseQuantity(CartProductModel cartProductModel) {
    if (cartProductModel.quantity > 1) {
      cartItems
          .firstWhere((element) => element.id == cartProductModel.id)
          .quantity--;
      cartItems.refresh();
    }
  }

  void increaseQuantity(CartProductModel cartProductModel) {
    cartItems
        .firstWhere((element) => element.id == cartProductModel.id)
        .quantity++;
    cartItems.refresh();
  }
}
