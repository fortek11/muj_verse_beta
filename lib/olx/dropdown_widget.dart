import 'package:flutter/material.dart';
import 'package:muj_verse_beta/state/data_state.dart';
import 'package:provider/provider.dart';

class CustomDropdown extends StatelessWidget {
  final categories = [
    'Thrift',
    'Electronics',
    'Accessories',
    'Footwear',
    'Books/Notes',
    'Stationary',
    'Posters',
    'Others'
  ];
  Widget build(BuildContext context) {
    final categoryState = Provider.of<DataState>(context);
    return Container(
      width: MediaQuery.sizeOf(context).width,
      margin: const EdgeInsets.only(right: 0),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black38),
        color: categoryState.sellOLXItemCategory == null
            ? Colors.grey.shade100
            : Colors.white,
        boxShadow: [],
        borderRadius: BorderRadius.circular(12),
      ),
      child: DropdownButton(
        isExpanded: true,
        items: [0, 1, 2, 3, 4, 5, 6, 7].map((e) {
          return DropdownMenuItem(
            enabled: true,
            value: e,
            child: Text(
              categories[e].toString(),
              style: TextStyle(
                fontSize: 17,
              ),
            ),
          );
        }).toList(),
        underline: Container(
          color: Colors.transparent,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 0),
        hint: const Text('Category',
            style: TextStyle(
                color: Color.fromARGB(255, 186, 185, 185), fontSize: 17)),
        value: categoryState.sellOLXItemCategory,
        style: const TextStyle(
            color: Colors.black, fontSize: 14, fontWeight: FontWeight.w500),
        onChanged: (value) {
          categoryState.sellOLXItemCategory = value as int?;
          categoryState.notifyListeners();
        },
        icon: null,
        dropdownColor: Colors.white,
        borderRadius: BorderRadius.circular(10),
        elevation: 4,
        iconEnabledColor: Colors.black,
        focusColor: Colors.white,
      ),
    );
  }
}
