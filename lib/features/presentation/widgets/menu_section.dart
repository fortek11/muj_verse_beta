import 'package:flutter/material.dart';

class MenuSection extends StatelessWidget {
  final Map<String, dynamic> menuSectionItems;
  MenuSection(this.menuSectionItems);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: menuSectionItems.length,
        itemBuilder: (context, index) {
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
            color: Colors.transparent,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(menuSectionItems.keys.elementAt(index),
                    style: TextStyle(fontSize: 18)),
                Text(menuSectionItems.values.elementAt(index),
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.w600))
              ],
            ),
            // child: ListTile(
            //   contentPadding: EdgeInsets.symmetric(horizontal: 15),
            //   title: Text(menuSectionItems.keys.elementAt(index),
            //       style: TextStyle(fontSize: 16)),
            //   trailing: Text(menuSectionItems.values.elementAt(index),
            //       style: const TextStyle(
            //           fontSize: 16, fontWeight: FontWeight.w600)),
            // ),
          );
        });
  }
}
