import 'package:flutter/material.dart';
import 'package:muj_verse_beta/features/presentation/screens/post_new_carpool.dart';
import 'package:muj_verse_beta/features/presentation/widgets/carpool_find_ride.dart';

import '../widgets/bottom_nav.dart';

class CarPoolScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 243, 245, 250),
      drawer: Drawer(),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 243, 245, 250),
        actions: [
          IconButton(
              onPressed: () {}, icon: Icon(Icons.notifications_active_rounded))
        ],
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                width: 300,
                child: const Text(
                  'Find Your Nearest Ride',
                  style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 15),
                child: Image.asset(
                  'assets/car-sharing.png',
                  scale: 6,
                ),
              )
            ],
          ),
          CarpoolFindRide(),
          const SizedBox(
            height: 10,
          ),
          const Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Divider(
                  thickness: 2,
                  indent: 20,
                ),
              ),
              Text(' OR '),
              Expanded(
                child: Divider(
                  thickness: 2,
                  endIndent: 20,
                ),
              )
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pushNamed(PostNewCarpoolRide.routeName);
            },
            style: ElevatedButton.styleFrom(
                elevation: 2,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                backgroundColor: const Color.fromARGB(255, 189, 218, 253),
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 110)),
            child: const Text(
              "Post A New Ride",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
            ),
          )
        ],
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
