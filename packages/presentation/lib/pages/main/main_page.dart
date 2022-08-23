import 'package:flutter/material.dart';
import 'package:presentation/components/product_grid_view.dart';

class MainPage extends StatelessWidget {
  const MainPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          children: <Widget>[
            Text('main page'),
            ProductGridView(
              products: [],
            ),
          ],
        ),
      ),
    );
  }
}
