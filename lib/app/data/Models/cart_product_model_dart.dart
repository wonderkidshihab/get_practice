// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:get_practice/app/data/Models/product_model.dart';
import 'package:get_practice/app/data/Models/rating_model.dart';

class CartProductModel extends ProductModel {
  int quantity;
  CartProductModel({
    this.quantity = 1,
    int? id,
    String? title,
    double? price,
    String? description,
    String? category,
    String? image,
    Rating? rating,
  }) : super(
          id: id,
          title: title,
          price: price,
          description: description,
          category: category,
          image: image,
          rating: rating,
        );

  CartProductModel.fromProductModel(ProductModel productModel)
      : quantity = 1,
        super(
          id: productModel.id,
          title: productModel.title,
          price: productModel.price,
          description: productModel.description,
          category: productModel.category,
          image: productModel.image,
          rating: productModel.rating,
        );
}
