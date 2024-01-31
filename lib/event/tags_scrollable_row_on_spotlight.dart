import 'package:flutter/material.dart';

class TagsRowSectionOnSpotlightScreen extends StatelessWidget {
  final List tagsList;
  TagsRowSectionOnSpotlightScreen(this.tagsList);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: tagsList.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 7.5, vertical: 0.5),
            margin: EdgeInsets.only(
              right: 4,
            ),
            decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey.shade300,
                ),
                borderRadius: BorderRadius.circular(15)),
            child: Text(tagsList[index].toString(),
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.grey,
                )),
          );
        });
  }
}
