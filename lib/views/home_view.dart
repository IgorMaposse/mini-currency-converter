import 'dart:ui';

import 'package:apitest/controllers/home_controller.dart';
import 'package:apitest/models/currency_model.dart';
import 'package:apitest/widgets/currency_box.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final TextEditingController toText = TextEditingController();
  late HomeController homeController;
  final TextEditingController fromText = TextEditingController();
  @override
  void initState() {
    super.initState();
    homeController = HomeController(toText: toText, fromText: fromText);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
              top: 70, left: 8.0, right: 8.0, bottom: 8.0),
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                Image.asset(
                  'assets/images/images.jpeg',
                  width: 200,
                  height: 200,
                ),
                SizedBox(
                  height: 50,
                ),
                CurrencyBox(homeController.currencies, toText, (model) {
                  setState(() {
                    homeController.toCurrency = model as CurrencyModel;
                  });
                }, homeController.toCurrency),
                CurrencyBox(
                  homeController.currencies,
                  fromText,
                  (model) {
                    setState(() {
                      homeController.toCurrency = model as CurrencyModel;
                    });
                  },
                  homeController.fromCurrency,
                ),
                SizedBox(
                  height: 25,
                ),
                ElevatedButton(
                    onPressed: () {
                      homeController.convert();
                    },
                    child: const Text('Converter')),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
