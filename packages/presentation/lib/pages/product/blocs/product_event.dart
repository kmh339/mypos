part of 'product_bloc.dart';

abstract class ProductEvent extends Equatable {
  const ProductEvent();

  @override
  List<Object?> get props => [];
}

class ProductListFetched extends ProductEvent {}

class ProductSelected extends ProductEvent {
  const ProductSelected({
    required this.price,
  });

  final double price;

  @override
  List<Object?> get props => [
        price,
      ];
}
