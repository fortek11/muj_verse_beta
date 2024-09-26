import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_pagination/firebase_pagination.dart';
import 'package:flutter/material.dart';
import 'package:muj_verse_beta/core/bottom_nav.dart';
import 'package:muj_verse_beta/olx/category_widget.dart';
import 'package:muj_verse_beta/olx/product_widget.dart';
import 'package:muj_verse_beta/olx/sell_item_screen.dart';
import 'package:muj_verse_beta/state/data_state.dart';
import 'package:provider/provider.dart';

class OlxScreen extends StatelessWidget {
  static const routeName = 'olxscreen';
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    final dataState = Provider.of<DataState>(context);

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 41, 51, 65),
        foregroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          'muj marketplace',
          style: TextStyle(
              color: Colors.white, fontSize: 25, fontWeight: FontWeight.w600),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Stack(
              children: [
                Container(
                  height: 15,
                  color: const Color.fromARGB(255, 41, 51, 65),
                ),
                Container(
                  height: 15,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20))),
                ),
              ],
            ),
            Container(
              height: 150,
              margin: EdgeInsets.symmetric(
                horizontal: 10,
              ),
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color.fromARGB(255, 233, 242, 255),
                        Color.fromARGB(255, 240, 247, 255),
                        Color.fromARGB(255, 198, 222, 255)
                      ]),
                  borderRadius: BorderRadius.circular(15)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: (screenWidth / 2),
                    padding: EdgeInsets.all(15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FittedBox(
                          child: Text(
                            'Cash In, Clear Out!',
                            style: TextStyle(
                                color: Color.fromARGB(255, 41, 51, 65),
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        FittedBox(
                          child: Text(
                            'Your One-Stop \nShop for Steals',
                            style: TextStyle(fontSize: 16),
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: Image.asset('assets/laptop-hand.png'))
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              '   Category',
              style: TextStyle(fontSize: 21, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 0,
            ),
            SizedBox(height: 100, child: OlxCategoryWidget()),
            Text(
              '   Products',
              style: TextStyle(fontSize: 21, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 15,
            ),
            FirestorePagination(
              limit: 10,
              viewType: ViewType.grid,
              bottomLoader: Center(
                child: CircularProgressIndicator(),
              ),
              query: FirebaseFirestore.instance.collection('olx'),
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
            SizedBox(
              height: 70,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.of(context).pushNamed(SellItemOlxScreen.routeName);
        },
        label: Text('Sell Item'),
        icon: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}
