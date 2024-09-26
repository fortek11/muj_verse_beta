import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:math' as math;
import 'package:flutter/material.dart';

class BookCabScreen extends StatelessWidget {
  static const routeName = "bookacabscreen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('book a cab'),
      ),
      body: FutureBuilder(
        future: FirebaseFirestore.instance
            .collection('quick-service')
            .doc('book-cab')
            .get(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final List mapData = snapshot.data!['data'];
            return SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                      margin: EdgeInsets.all(10),
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(boxShadow: [
                        BoxShadow(
                            color: const Color.fromARGB(255, 214, 214, 214)
                                .withOpacity(0.5),
                            blurRadius: 10.0,
                            spreadRadius: 3)
                      ], borderRadius: BorderRadius.circular(15)),
                      child: Image.asset('assets/cab_banner.png')),
                  SizedBox(
                    height: 0,
                  ),
                  ListView.builder(
                      padding: EdgeInsets.all(15),
                      shrinkWrap: true,
                      itemCount: mapData.length,
                      itemBuilder: (context, index) {
                        final randomColor = Color(
                                (math.Random().nextDouble() * 0xFFFFFF).toInt())
                            .withOpacity(0.7);
                        final cabName = mapData.elementAt(index)['name'];
                        return Container(
                          padding: EdgeInsets.symmetric(vertical: 5),
                          margin: EdgeInsets.symmetric(vertical: 7),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  color:
                                      const Color.fromARGB(255, 214, 214, 214)
                                          .withOpacity(0.3),
                                  blurRadius: 10.0,
                                  spreadRadius: 3)
                            ],
                          ),
                          child: ListTile(
                            leading: CircleAvatar(
                              backgroundColor: randomColor.withOpacity(0.2),
                              child: Text(cabName[0]),
                            ),
                            title: Text(cabName),
                            subtitle: Text(
                              'Ertiga, 4 Wheeler',
                              style: TextStyle(color: Colors.grey),
                            ),
                            trailing: IconButton(
                              onPressed: () {},
                              icon: CircleAvatar(
                                maxRadius: 12,
                                backgroundColor:
                                    const Color.fromARGB(80, 76, 175, 79),
                                child: Icon(
                                  Icons.call,
                                  size: 12,
                                  color: Colors.green,
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                ],
              ),
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
