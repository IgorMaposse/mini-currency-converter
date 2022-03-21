import 'package:apitest/models/currency_model.dart';
import 'package:flutter/material.dart';

class CurrencyBox extends StatelessWidget {
  final List<CurrencyModel>? items;
  final CurrencyModel selectedItem;
  final TextEditingController controller;
  final void Function(CurrencyModel? model)? onChanged;
  CurrencyBox(this.items, this.controller, this.onChanged, this.selectedItem);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: SizedBox(
            height: 81,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: DropdownButton<CurrencyModel>(
                isExpanded: true,
                underline: Container(
                  height: 1,
                  color: Colors.amber,
                ),
                value: selectedItem,
                items: (items
                    ?.map(
                        (e) => DropdownMenuItem(value: e, child: Text(e.name)))
                    .toList()) as List<DropdownMenuItem<CurrencyModel>>,
                onChanged: onChanged,
              ),
            ),
          ),
        ),
        Expanded(
            flex: 2,
            child: TextField(
              controller: controller,
              decoration: const InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.amber),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.amber),
                  )),
            )),
      ],
    );
  }
}
