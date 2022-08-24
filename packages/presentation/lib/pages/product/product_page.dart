import 'package:domain/repositories/product_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:presentation/pages/product/blocs/product_bloc.dart';
import 'package:presentation/pages/product/components/product_grid_view.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProductBloc>(
      create: (_) => ProductBloc(
        productRepository: context.read<ProductRepository>(),
      )..add(ProductListFetched()),
      child: Scaffold(
        body: SafeArea(
          minimum: EdgeInsets.all(20),
          child: Center(
            child: BlocBuilder<ProductBloc, ProductState>(
              builder: (_, ProductState state) {
                if (state.status == ProductStatus.loading) {
                  return CircularProgressIndicator();
                }

                if (state.status == ProductStatus.failure) {
                  return Text('failure');
                }

                return Column(
                  children: [
                    Expanded(
                      child: ProductGridView(
                        products: state.products,
                      ),
                    ),
                    SizedBox(
                      height: 32,
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        '총 가격 : ${state.totalPrice} 원',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 32,
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
