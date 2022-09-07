import 'package:get/get.dart';
import 'package:get_practice/app/Utils/api_client.dart';
import 'package:get_practice/app/data/Models/product_model.dart';

class ProductRepositories {
  static Future<List<ProductModel>> getProducts() async {
    var response = await Get.find<ApiClient>().get('products');
    if (response != null) {
      return List<ProductModel>.from(
          response.map((x) => ProductModel.fromJson(x)));
    } else {
      return [];
    }
  }
}
