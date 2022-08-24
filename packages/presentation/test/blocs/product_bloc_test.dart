import 'package:bloc_test/bloc_test.dart';
import 'package:domain/entities/product.dart';
import 'package:domain/repositories/product_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:presentation/pages/product/blocs/product_bloc.dart';

import 'product_bloc_test.mocks.dart';

@GenerateMocks(
  [
    ProductRepository,
  ],
)
void main() {
  group(
    'Product Bloc Test',
    () {
      late ProductRepository productRepository;
      final List<Product> products = [
        Product(id: 1, name: 'name', price: 0.0),
      ];

      setUp(
        () {
          productRepository = MockProductRepository();
        },
      );

      blocTest(
        'emits success with List<Product>',
        build: () => ProductBloc(productRepository: productRepository),
        setUp: () {
          when(
            productRepository.getProducts(),
          ).thenAnswer((_) async => products);
        },
        act: (ProductBloc bloc) => bloc.add(ProductListFetched()),
        wait: const Duration(seconds: 1),
        expect: () => <ProductState>[
          const ProductState(status: ProductStatus.loading),
          ProductState(status: ProductStatus.success, products: products),
        ],
      );

      blocTest(
        'emits total price plus 1000 when ProductSelected is added',
        build: () => ProductBloc(
          productRepository: productRepository,
        ),
        act: (ProductBloc bloc) => bloc.add(
          ProductSelected(price: 1000.0),
        ),
        wait: const Duration(seconds: 1),
        expect: () => <ProductState>[
          ProductState(
            status: ProductStatus.success,
            totalPrice: 1000.0,
          ),
        ],
      );
    },
  );
}
