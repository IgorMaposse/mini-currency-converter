import 'package:apitest/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  final TextEditingController fromText = TextEditingController();
  TextEditingController toText = TextEditingController();
  final homeController = HomeController(fromText: fromText, toText: toText);
  test('converter de real para dolar', () {
    toText = 2.0 as TextEditingController;
    homeController.convert();
    expect(fromText.text, 0.36);
  });
}
