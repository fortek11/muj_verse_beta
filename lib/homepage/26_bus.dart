import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class BusTimingScreen extends StatelessWidget {
  static const routeName = 'bustimingscreen';

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 250, 250, 255),
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '26 No. \nBus Timings',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
                  ),
                  Image.asset(
                    'assets/bus.png',
                    scale: 7,
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    padding: EdgeInsets.all(8),
                    width: screenWidth / 2 - 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: const Color.fromARGB(255, 214, 214, 214)
                                .withOpacity(0.5),
                            blurRadius: 10.0,
                            spreadRadius: 3)
                      ],
                    ),
                    child: Column(
                      children: [
                        Text(
                          'Manipal to Jaipur',
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        FutureBuilder(
                          future: FirebaseFirestore.instance
                              .collection('quick-service')
                              .doc('manipal-2-jaipur')
                              .get(),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              final stringMap =
                                  snapshot.data!.data()!['timing'];
                              List<String> timings = stringMap!.split(",");

                              return Column(
                                children: [
                                  ...timings.map((e) {
                                    return Text(e.toString());
                                  }).toList()
                                ],
                              );
                            }
                            if (snapshot.hasError) {
                              return Text(snapshot.error.toString());
                            } else {
                              return Center(child: CircularProgressIndicator());
                            }
                          },
                        )
                      ],
                    ),
                  ),
                  Container(
                    width: screenWidth / 2 - 40,
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: const Color.fromARGB(255, 214, 214, 214)
                                .withOpacity(0.5),
                            blurRadius: 10.0,
                            spreadRadius: 3)
                      ],
                    ),
                    child: Column(
                      children: [
                        Text(
                          'Jaipur to Manipal',
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        FutureBuilder(
                          future: FirebaseFirestore.instance
                              .collection('quick-service')
                              .doc('manipal-2-jaipur')
                              .get(),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              final stringMap =
                                  snapshot.data!.data()!['timing'];
                              List<String> timings = stringMap!.split(",");

                              return Column(
                                children: [
                                  ...timings.map((e) {
                                    return Text(e.toString());
                                  }).toList()
                                ],
                              );
                            }
                            if (snapshot.hasError) {
                              return Text(snapshot.error.toString());
                            } else {
                              return Center(child: CircularProgressIndicator());
                            }
                          },
                        )
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 50,
              )
            ],
          ),
        ),
      ),
    );
  }
}
