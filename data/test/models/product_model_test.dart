import 'dart:convert';

import 'package:data/models/product_model.dart';
import 'package:flutter_test/flutter_test.dart';

import '../helpers/helper.dart';

void main() {
  group('Product Model Test', () {
    setUp(() {
      TestWidgetsFlutterBinding.ensureInitialized();
    });

    test('상품정보 from json', () async {
      final Map<String, dynamic> productResponse = jsonDecode(
        await readJson('mock_product_response.json'),
      );

      final ProductModel productModel = ProductModel.fromJson(productResponse);

      expect(productModel, equals(productModel));
    });
  });
}
