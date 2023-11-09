import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../state/menu_carpool_state.dart';
import '../widgets/bottom_nav.dart';
import '../widgets/restaurant_tile.dart';
import '../widgets/search.dart';

class MenuScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextEditingController _textController = TextEditingController();
    print('hi');
    final menuState = Provider.of<DataState>(context);
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 243, 245, 250),
      appBar: AppBar(
          centerTitle: true,
          backgroundColor: Color(0xFF1D2228),
          title: const CircleAvatar(
            backgroundColor: Colors.transparent,
            child: Icon(
              size: 40,
              Icons.fastfood,
              color: Colors.white,
            ),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  FirebaseAuth.instance.signOut();
                },
                icon: const Icon(
                  Icons.logout,
                  color: Color(0xFFB0B2C0),
                ))
          ]),
      body: FutureBuilder(
          future: menuState.getOutlets(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              print(snapshot.data);
              return SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      color: Color(0xFF1D2228),
                      width: double.infinity,
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 5,
                          ),
                          const SizedBox(
                            width: 300,
                            child: Text(
                              "Eat, Laugh, Repeat!",
                              style: TextStyle(
                                  color: Color(0xFFEEFCFF),
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 2, horizontal: 15),
                            width: 230,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text("Outlets OnBoard:",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500)),
                                CircleAvatar(
                                  backgroundColor:
                                      Color.fromARGB(83, 174, 203, 239),
                                  maxRadius: 16,
                                  child: Text("${snapshot.data!.length}",
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 17.5)),
                                )
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.all(10),
                            width: MediaQuery.sizeOf(context).width * 0.9,
                            child: SearchInput(
                                textController: _textController,
                                hintText: 'Search here'),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                            height: 25,
                            decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(25),
                                    topRight: Radius.circular(25)),
                                color: Color(0xFFEDEDEE)),
                            child: const Center(),
                          )
                        ],
                      ),
                    ),
                    Flexible(
                      fit: FlexFit.loose,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(25),
                        child: Container(
                          child: ListView.builder(
                              shrinkWrap: true,
                              padding: const EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 12),
                              itemCount: snapshot.data!.length,
                              itemBuilder: ((context, index) {
                                return RestaurantTile(
                                    snapshot.data![index].toString());
                              })),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(
                  color: Color(0xFF1D2228),
                ),
              );
            }
          }),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
