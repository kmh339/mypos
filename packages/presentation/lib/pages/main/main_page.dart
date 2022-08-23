import 'package:flutter/material.dart';
import 'package:presentation/pages/product/product_page.dart';

class MainPage extends StatelessWidget {
  const MainPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: const EdgeInsets.symmetric(vertical: 20),
        child: ProductPage(),
      ),
    );
  }
}
