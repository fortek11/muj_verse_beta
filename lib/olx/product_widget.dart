import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:muj_verse_beta/olx/olx_item_detail_screen.dart';

class OlxItemWidget extends StatelessWidget {
  final Map<dynamic, dynamic> itemdata;
  OlxItemWidget(this.itemdata);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return OlxItemDetailScreen(itemdata);
        }));
      },
      child: Container(
        width: 120,
        padding: EdgeInsets.only(top: 9, left: 10, right: 10, bottom: 7),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Color.fromARGB(170, 226, 232, 238)),
        child: Stack(
          children: [
            FractionallySizedBox(
              heightFactor: 0.78,
              child: Container(
                alignment: Alignment.topCenter,
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(itemdata['image']),
                        fit: BoxFit.cover,
                        alignment: Alignment.center),
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(15)),
              ),
            ),
            Positioned(
              bottom: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '₹ ${itemdata['price']}',
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                        color: Color.fromARGB(255, 65, 93, 133)),
                  ),
                  Text(
                    itemdata['title'],
                    style: TextStyle(color: Colors.grey.shade700),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
