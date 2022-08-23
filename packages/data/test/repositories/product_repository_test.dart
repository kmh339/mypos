import 'package:data/repositories/product_repository_impl.dart';
import 'package:domain/entities/product.dart';
import 'package:domain/repositories/product_repository.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group(
    'Product Repository Test',
    () {
      setUp(() {
        TestWidgetsFlutterBinding.ensureInitialized();
      });

      test(
        'return 3 products',
        () async {
          final ProductRepository productRepository = ProductRepositoryImpl();

          final List<Product> products = await productRepository.getProducts();

          expect(3, equals(products.length));
        },
      );
    },
  );
}
