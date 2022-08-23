import 'package:domain/entities/product.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_model.freezed.dart';

part 'product_model.g.dart';

@freezed
class ProductModel with _$ProductModel {
  const ProductModel._();

  const factory ProductModel({
    required int id,
    required String name,
    required double price,
  }) = _ProductModel;

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);

  Product toEntity() => Product(
        id: id,
        name: name,
        price: price,
      );
}
