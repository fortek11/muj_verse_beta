import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../state/menu_carpool_state.dart';

class PostToCarpoolDropdown extends StatelessWidget {
  final List locations = ['Hostel', 'Airport', 'Station', 'Other'];
  @override
  Widget build(BuildContext context) {
    final carpoolState = Provider.of<DataState>(context);
    return Container(
      margin: EdgeInsets.only(right: 10),
      padding: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black38),
        color: Colors.grey.shade200,
        boxShadow: [],
        borderRadius: BorderRadius.circular(12),
      ),
      child: DropdownButton(
        items: [0, 1, 2, 3].map((e) {
          return DropdownMenuItem(
            enabled: carpoolState.postFromCarpoolValue == e ? false : true,
            value: e,
            child: Text(
              locations[e].toString(),
              style: TextStyle(
                  fontSize: 17,
                  decoration: carpoolState.postFromCarpoolValue == e
                      ? TextDecoration.lineThrough
                      : TextDecoration.none,
                  color: carpoolState.postFromCarpoolValue == e
                      ? Colors.grey
                      : Colors.black),
            ),
          );
        }).toList(),
        underline: Container(
          color: Colors.transparent,
        ),
        padding: EdgeInsets.symmetric(horizontal: 5, vertical: 0),
        hint: const Text('To',
            style: TextStyle(
                color: Color.fromARGB(255, 186, 185, 185), fontSize: 17)),
        value: carpoolState.postToCarpoolValue,
        style: const TextStyle(
            color: Colors.black, fontSize: 14, fontWeight: FontWeight.w500),
        onChanged: (value) {
          carpoolState.postToCarpoolValue = value!;
          carpoolState.notifyListeners();
        },
        icon: null,
        dropdownColor: Colors.white,
        borderRadius: BorderRadius.circular(12),
        elevation: 4,
        iconEnabledColor: Colors.black,
        focusColor: Colors.white,
      ),
    );
  }
}
