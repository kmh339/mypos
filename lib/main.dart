import 'package:data/repositories/product_repository_impl.dart';
import 'package:domain/repositories/product_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:presentation/pages/main/main_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider<ProductRepository>(
      create: (_) => ProductRepositoryImpl(),
      child: const MaterialApp(
        home: MainPage(),
      ),
    );
  }
}
