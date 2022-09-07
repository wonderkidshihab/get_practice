import 'package:get/get.dart';
import 'package:get_practice/app/data/Models/product_model.dart';
import 'package:get_practice/app/data/Repositories/product_repositories.dart';

class HomeSectionController extends GetxController {
  RxList<ProductModel> products = <ProductModel>[].obs;
  @override
  void onInit() {
    getProducts();
    super.onInit();
  }

  getProducts() async {
    products.clear();
    products.addAll(await ProductRepositories.getProducts());
  }
}
