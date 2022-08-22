import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

Future<String> readJson(String fileName) async {
  return await rootBundle.loadString('test/helpers/mock_data/$fileName');
}
