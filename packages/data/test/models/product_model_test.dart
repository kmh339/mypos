import 'dart:convert';

import 'package:data/models/product_model.dart';
import 'package:domain/entities/product.dart';
import 'package:flutter_test/flutter_test.dart';

import '../helpers/helper.dart';

void main() {
  group('Product Model Test', () {
    setUp(() {
      TestWidgetsFlutterBinding.ensureInitialized();
    });

    test('get ProductModel from json', () async {
      final Map<String, dynamic> productResponse = jsonDecode(
        await readJson('mock_product_response.json'),
      );

      final ProductModel productModel = ProductModel.fromJson(productResponse);

      expect(productModel, equals(productModel));
    });

    test(
      'get ProductEntity from ProductModel',
      () async {
        final Map<String, dynamic> productResponse = jsonDecode(
            await readJson('mock_product_response.json'),
        );

        final ProductModel productModel = ProductModel.fromJson(productResponse);

        final Product product = productModel.toEntity();

        expect(product, equals(product));
      },
    );
  });
}
