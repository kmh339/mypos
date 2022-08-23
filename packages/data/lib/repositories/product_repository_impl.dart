import 'dart:convert';

import 'package:data/helpers/helper.dart';
import 'package:data/models/product_model.dart';
import 'package:domain/entities/product.dart';
import 'package:domain/repositories/product_repository.dart';

class ProductRepositoryImpl implements ProductRepository {
  @override
  Future<List<Product>> getProducts() async {
    // final Map<String, dynamic> response = jsonDecode(
    //   await readJson('lib/helpers/mock_data/mock_products_response.json'),
    // );

    final Map<String, dynamic> response = {
      "data": [
        {
          "id": 1,
          "name": "마라탕",
          "price": 19000.0
        },
        {
          "id": 2,
          "name": "탕수육",
          "price": 14000.0
        },
        {
          "id": 3,
          "name": "짜장면",
          "price": 3000.0
        }
      ]
    };

    final List<dynamic> productsResponse = response['data'] as List<dynamic>;

    final List<ProductModel> productModels = productsResponse
        .map((dynamic json) =>
            ProductModel.fromJson(json as Map<String, dynamic>))
        .toList();

    return productModels.map((e) => e.toEntity()).toList();
  }
}
