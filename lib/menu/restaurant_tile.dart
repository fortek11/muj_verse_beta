import 'package:flutter/material.dart';

import 'dart:math' as math;

import 'outlet_detail_menu.dart';

class RestaurantTile extends StatelessWidget {
  final String outletName;
  RestaurantTile(this.outletName);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context)
            .pushNamed(OutletDetailMenu.routeName, arguments: outletName);
      },
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: const BorderSide(color: Color.fromARGB(255, 231, 230, 230))),
        elevation: 1.5,
        color: Color.fromARGB(255, 255, 255, 255),
        shadowColor: Color.fromARGB(188, 30, 31, 33),
        child: ListTile(
          contentPadding:
              const EdgeInsets.only(bottom: 9, top: 9, left: 10, right: 15),
          leading: CircleAvatar(
            backgroundColor:
                Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
                    .withOpacity(0.7),
            child: Text(
              outletName[0],
              style: TextStyle(color: Colors.black.withOpacity(0.75)),
            ),
          ),
          title: Text(
            outletName,
            style: const TextStyle(fontSize: 17.5, fontWeight: FontWeight.w500),
          ),
          trailing: const CircleAvatar(
            backgroundColor: Color.fromARGB(96, 204, 206, 223),
            maxRadius: 18,
            child: Icon(
              Icons.arrow_forward_rounded,
              size: 22,
              color: Color.fromARGB(188, 30, 31, 33),
            ),
          ),
        ),
      ),
    );
  }
}
