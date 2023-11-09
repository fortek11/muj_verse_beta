import 'package:flutter/material.dart';
import 'package:muj_verse_beta/features/presentation/state/menu_carpool_state.dart';
import 'package:provider/provider.dart';

class PostFromCarpoolDropdown extends StatelessWidget {
  final List locations = ['Hostel', 'Airport', 'Station', 'Other'];
  @override
  Widget build(BuildContext context) {
    final carpoolState = Provider.of<DataState>(context);
    return Container(
      margin: const EdgeInsets.only(right: 10),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black38),
        color: Colors.grey.shade200,
        boxShadow: [],
        borderRadius: BorderRadius.circular(12),
      ),
      child: DropdownButton(
        items: [0, 1, 2, 3].map((e) {
          return DropdownMenuItem(
            enabled: carpoolState.postToCarpoolValue == e ? false : true,
            value: e,
            child: Text(
              locations[e].toString(),
              style: TextStyle(
                  fontSize: 17,
                  decoration: carpoolState.postToCarpoolValue == e
                      ? TextDecoration.lineThrough
                      : TextDecoration.none,
                  color: carpoolState.postToCarpoolValue == e
                      ? Colors.grey
                      : Colors.black),
            ),
          );
        }).toList(),
        underline: Container(
          color: Colors.transparent,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 0),
        hint: const Text('From',
            style: TextStyle(
                color: Color.fromARGB(255, 186, 185, 185), fontSize: 17)),
        value: carpoolState.postFromCarpoolValue,
        style: const TextStyle(
            color: Colors.black, fontSize: 14, fontWeight: FontWeight.w500),
        onChanged: (value) {
          carpoolState.postFromCarpoolValue = value!;
          carpoolState.notifyListeners();
        },
        icon: null,
        dropdownColor: Colors.white,
        borderRadius: BorderRadius.circular(5),
        elevation: 4,
        iconEnabledColor: Colors.black,
        focusColor: Colors.white,
      ),
    );
  }
}
