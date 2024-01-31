import 'package:flutter/material.dart';
import 'package:muj_verse_beta/state/data_state.dart';
import 'package:provider/provider.dart';

class ChooseCategoryEventSpotlight extends StatelessWidget {
  const ChooseCategoryEventSpotlight({super.key});

  @override
  Widget build(BuildContext context) {
    final categoriesListData = Provider.of<DataState>(context).eventCategories;
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categoriesListData.entries.length,
        itemBuilder: (context, index) {
          return InkWell(
              onTap: () {},
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 5),
                padding: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white),
                child: Row(
                  children: [
                    Icon(categoriesListData.entries.elementAt(index).value),
                    SizedBox(
                      width: 2,
                    ),
                    Text(categoriesListData.entries.elementAt(index).key)
                  ],
                ),
              ));
        });
  }
}
