import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:domain/entities/product.dart';
import 'package:domain/repositories/product_repository.dart';
import 'package:equatable/equatable.dart';

part 'product_event.dart';

part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc({
    required ProductRepository productRepository,
  })  : _productRepository = productRepository,
        super(const ProductState()) {
    on<ProductListFetched>(_onProductListFetched);
    on<ProductSelected>(_onProductSelected);
  }

  final ProductRepository _productRepository;

  Future<void> _onProductListFetched(
    ProductListFetched event,
    Emitter<ProductState> emit,
  ) async {
    emit(
      state.copyWith(
        status: ProductStatus.loading,
      ),
    );

    final List<Product> products = await _productRepository.getProducts();

    emit(
      state.copyWith(
        status: ProductStatus.success,
        products: products,
      ),
    );
  }

  Future<void> _onProductSelected(
    ProductSelected event,
    Emitter<ProductState> emit,
  ) async {
    emit(
      state.copyWith(
        status: ProductStatus.success,
        totalPrice: state.totalPrice + event.price,
      ),
    );
  }
}
