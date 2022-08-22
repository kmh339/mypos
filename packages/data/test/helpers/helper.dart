import 'package:flutter/services.dart';

Future<String> readJson(String fileName) async {
  return await rootBundle.loadString('test/helpers/mock_data/$fileName');
}
