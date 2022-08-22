import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  void addOne() {}

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('hi'),
    );
  }
}
