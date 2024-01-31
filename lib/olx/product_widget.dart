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
          height: 200,
          width: 100,
          alignment: Alignment.bottomCenter,
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(itemdata['image']),
                  fit: BoxFit.cover,
                  alignment: Alignment.bottomCenter),
              color: Colors.black,
              borderRadius: BorderRadius.circular(15)),
          child: Container(
              padding: EdgeInsets.only(top: 3, left: 5, right: 10),
              clipBehavior: Clip.hardEdge,
              height: 70,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color.fromARGB(64, 255, 255, 255).withOpacity(0.5),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10)),
              ),
              child: BackdropFilter(
                filter: ImageFilter.blur(
                    sigmaX: 20.0, sigmaY: 20.0, tileMode: TileMode.repeated),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      itemdata['title'],
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                    Text(
                      '₹ ${itemdata['price']}',
                      style: TextStyle(fontWeight: FontWeight.w600),
                    )
                  ],
                ),
              ))),
    );
  }
}
