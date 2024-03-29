import 'package:flutter/material.dart';
import 'package:muj_verse_beta/state/data_state.dart';
import 'package:provider/provider.dart';

class SearchFromDropdownCarpool extends StatelessWidget {
  final List fromWhere = ['Hostel', 'Airport', 'Station', 'Other'];

  @override
  Widget build(BuildContext context) {
    final carpoolState = Provider.of<DataState>(context);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
          boxShadow: [],
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
              color: carpoolState.fromCarpoolValue == null
                  ? Color.fromARGB(200, 255, 255, 255)
                  : Color.fromARGB(255, 87, 183, 96),
              width: 1.5),
          color: carpoolState.fromCarpoolValue == null
              ? Color.fromARGB(46, 127, 131, 149)
              : Color.fromARGB(172, 176, 178, 192)),
      child: DropdownButton(
        items: [0, 1, 2, 3].map((e) {
          return DropdownMenuItem(
            enabled: carpoolState.toCarpoolValue == e ? false : true,
            value: e,
            child: Text(
              fromWhere[e].toString(),
              style: TextStyle(
                decoration: carpoolState.toCarpoolValue == e
                    ? TextDecoration.lineThrough
                    : TextDecoration.none,
                color: carpoolState.toCarpoolValue == e
                    ? Colors.grey
                    : carpoolState.toCarpoolValue == null
                        ? Colors.black
                        : Color.fromARGB(255, 237, 235, 235),
                fontSize: 17,
              ),
            ),
          );
        }).toList(),
        underline: Container(
          color: Colors.transparent,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 0),
        hint: const Text('Select Destination',
            style: TextStyle(
                color: Color.fromARGB(255, 186, 185, 185), fontSize: 17)),
        value: carpoolState.fromCarpoolValue,
        style: const TextStyle(
            color: Colors.black, fontSize: 14, fontWeight: FontWeight.w500),
        onChanged: (value) {
          carpoolState.changeFromCarpoolValue(value!);
        },
        dropdownColor: const Color.fromARGB(240, 167, 169, 183),
        borderRadius: BorderRadius.circular(12),
        elevation: 4,
        iconEnabledColor: Colors.black,
        focusColor: Colors.white,
      ),
    );
  }
}
