import 'package:flutter/material.dart';
import 'package:muj_verse_beta/features/presentation/screens/all_events_screen.dart';
import 'package:muj_verse_beta/features/presentation/widgets/bottom_nav.dart';
import 'package:muj_verse_beta/features/presentation/widgets/choose_category_event_spotlight.dart';
import 'package:muj_verse_beta/features/presentation/widgets/popular_events_section.dart';
import 'package:muj_verse_beta/features/presentation/widgets/upcoming_events_spotlight_screen_section.dart';

class EventSpotlightScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 243, 245, 250),
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: Color(0xFF1D2228),
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 1,
            ),
            Text(
              'Welcome Back,',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(
              height: 2,
            ),
            Text(
              'Event Spotlight',
              style: TextStyle(fontSize: 37, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        actions: [
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.more_vert_outlined))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Column(
                  children: [
                    Container(
                        height: 100,
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        alignment: Alignment.centerRight,
                        width: double.infinity,
                        decoration: const BoxDecoration(
                          color: Color(0xFF1D2228),
                        ),
                        child: Image.asset(
                          'assets/event_spotlight_illu.png',
                        )),
                    Container(
                      width: double.infinity,
                      height: 50,
                    ),
                  ],
                ),
                Positioned(
                  right: 40,
                  left: 40,
                  height: 60,
                  bottom: 20,
                  child: Container(
                      alignment: Alignment.bottomCenter,
                      decoration: BoxDecoration(
                        boxShadow: const [
                          BoxShadow(
                              color: Color.fromARGB(10, 0, 0, 0),
                              blurRadius: 15,
                              spreadRadius: 3)
                        ],
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 5, vertical: 10),
                      child: TextField(
                        onTapOutside: (event) {
                          FocusScope.of(context).unfocus();
                        },
                        cursorColor: Colors.black54,
                        decoration: const InputDecoration(
                            hintText: 'Search here...',
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 15),
                            border: InputBorder.none,
                            suffixIcon: Icon(
                              Icons.search,
                              color: Colors.grey,
                            )),
                      )),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 10,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'Category',
                    style: TextStyle(fontWeight: FontWeight.w900, fontSize: 18),
                  ),
                  Container(
                      height: 40,
                      margin: const EdgeInsets.symmetric(vertical: 15),
                      child: const ChooseCategoryEventSpotlight()),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Popular Events',
                        style: TextStyle(
                            fontWeight: FontWeight.w900, fontSize: 18),
                      ),
                      TextButton(
                          onPressed: () {},
                          style: TextButton.styleFrom(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              shape: BeveledRectangleBorder(
                                  borderRadius: BorderRadius.circular(5))),
                          child: const Text(
                            'See more',
                            style: TextStyle(
                                color: Color.fromARGB(255, 106, 131, 161),
                                fontWeight: FontWeight.bold),
                          ))
                    ],
                  ),
                  Container(
                      height: 180,
                      margin: const EdgeInsets.symmetric(vertical: 15),
                      child: PopularEventSection()),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'All Events',
                        style: TextStyle(
                            fontWeight: FontWeight.w900, fontSize: 18),
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.pushNamed(
                                context, AllEventsScreen.routeName);
                          },
                          style: TextButton.styleFrom(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              shape: BeveledRectangleBorder(
                                  borderRadius: BorderRadius.circular(5))),
                          child: const Text(
                            'See more',
                            style: TextStyle(
                                color: Color.fromARGB(255, 106, 131, 161),
                                fontWeight: FontWeight.bold),
                          ))
                    ],
                  ),
                  UpcomingEventsSpotlightSection()
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}
