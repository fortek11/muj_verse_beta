import 'package:flutter/material.dart';
import 'package:muj_verse_beta/features/presentation/state/menu_carpool_state.dart';
import 'package:provider/provider.dart';

class SearchToDropdownCarpool extends StatelessWidget {
  final List toWhere = ['Hostel', 'Airport', 'Station', 'Other'];

  @override
  Widget build(BuildContext context) {
    final carpoolState = Provider.of<DataState>(context);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
          boxShadow: [
            // BoxShadow(
            //     color: Color.fromARGB(87, 128, 130, 131),
            //     offset: Offset.zero,
            //     spreadRadius: 2,
            //     blurRadius: 5)
          ],
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
              color: carpoolState.toCarpoolValue == null
                  ? const Color.fromARGB(172, 255, 255, 255)
                  : Color.fromARGB(200, 87, 183, 96),
              width: 1.5),
          color: carpoolState.toCarpoolValue == null
              ? Color.fromARGB(46, 127, 131, 149)
              : Color.fromARGB(172, 176, 178, 192)),
      child: DropdownButton(
        items: [0, 1, 2, 3].map((e) {
          return DropdownMenuItem(
            enabled: carpoolState.fromCarpoolValue == e ? false : true,
            value: e,
            child: Text(
              toWhere[e].toString(),
              style: TextStyle(
                  decoration: carpoolState.fromCarpoolValue == e
                      ? TextDecoration.lineThrough
                      : TextDecoration.none,
                  color: carpoolState.fromCarpoolValue == e
                      ? Colors.grey
                      : carpoolState.toCarpoolValue == null
                          ? Colors.black
                          : Color.fromARGB(255, 237, 235, 235),
                  fontSize: 17),
            ),
          );
        }).toList(),
        padding: EdgeInsets.symmetric(horizontal: 5, vertical: 0),
        underline: Container(
          color: Colors.transparent,
        ),
        dropdownColor: Color.fromARGB(239, 191, 193, 209),
        borderRadius: BorderRadius.circular(12),
        elevation: 4,
        hint: const Text('Select Destination',
            style: TextStyle(
                color: Color.fromARGB(255, 186, 185, 185), fontSize: 17)),
        value: carpoolState.toCarpoolValue,
        style: const TextStyle(
            color: Colors.black, fontSize: 14, fontWeight: FontWeight.w500),
        onChanged: (value) {
          carpoolState.changeToCarpoolValue(value!);
        },
        iconEnabledColor: Colors.black,
        focusColor: Colors.white,
      ),
    );
  }
}
