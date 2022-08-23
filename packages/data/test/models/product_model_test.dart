import 'dart:convert';

import 'package:data/helpers/helper.dart';
import 'package:data/models/product_model.dart';
import 'package:domain/entities/product.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Product Model Test', () {
    setUp(() {
      TestWidgetsFlutterBinding.ensureInitialized();
    });

    test('get ProductModel from json', () async {
      final Map<String, dynamic> productResponse = jsonDecode(
        await readJson('test/helpers/mock_data/mock_product_response.json'),
      );

      final ProductModel productModel = ProductModel.fromJson(productResponse);

      expect(productModel, equals(productModel));
    });

    test(
      'get ProductEntity from ProductModel',
      () async {
        final Map<String, dynamic> productResponse = jsonDecode(
            await readJson('test/helpers/mock_data/mock_product_response.json'),
        );

        final ProductModel productModel = ProductModel.fromJson(productResponse);

        final Product product = productModel.toEntity();

        expect(product, equals(product));
      },
    );
  });
}
