part of 'product_bloc.dart';

enum ProductStatus {
  initial,
  loading,
  success,
  failure,
}

class ProductState extends Equatable {
  const ProductState({
    this.status = ProductStatus.initial,
    this.products = const <Product>[],
    this.totalPrice = 0.0,
  });

  final ProductStatus status;
  final List<Product> products;
  final double totalPrice;

  ProductState copyWith({
    ProductStatus? status,
    List<Product>? products,
    double? totalPrice,
  }) =>
      ProductState(
        status: status ?? this.status,
        products: products ?? this.products,
        totalPrice: totalPrice ?? this.totalPrice,
      );

  @override
  List<Object> get props => [
        status,
        products,
        totalPrice,
      ];
}
