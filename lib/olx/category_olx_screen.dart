import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_pagination/firebase_pagination.dart';
import 'package:flutter/material.dart';
import 'package:muj_verse_beta/olx/product_widget.dart';

class OlxCategoryScreen extends StatelessWidget {
  final String appbarTitle;
  final int categoryInt;
  OlxCategoryScreen(this.appbarTitle, this.categoryInt);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(appbarTitle)),
      body: FirestorePagination(
        limit: 10,
        viewType: ViewType.grid,
        bottomLoader: Center(
          child: CircularProgressIndicator(),
        ),
        query: FirebaseFirestore.instance
            .collection("olx")
            .where("category", isEqualTo: categoryInt),
        itemBuilder: (context, snapshot, index) {
          return OlxItemWidget(snapshot.data() as Map);
        },
        scrollDirection: Axis.vertical,
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            crossAxisSpacing: 13,
            mainAxisSpacing: 13,
            childAspectRatio: 6 / 8,
            maxCrossAxisExtent: 210),
        padding: EdgeInsets.symmetric(horizontal: 18),
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
      ),
    );
  }
}
