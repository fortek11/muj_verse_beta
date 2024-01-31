import 'package:flutter/material.dart';
import 'package:muj_verse_beta/event/upcoming_events_spotlight_screen_section.dart';

class AllEventsScreen extends StatelessWidget {
  static const routeName = 'alleventscreen';

  final List dateFilters = ['Today', 'Tommorow', 'This Week', 'This Month'];

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 243, 245, 250),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 243, 245, 250),
        title: const Text(
          'All Events',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.filter_list))],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 5,
            ),
            Row(
                children: dateFilters.map((e) {
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 7),
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                    // boxShadow: [
                    //   BoxShadow(
                    //       color: Color.fromARGB(20, 0, 0, 0),
                    //       spreadRadius: 4,
                    //       blurRadius: 4)
                    // ],
                    color: Color.fromARGB(255, 243, 245, 250),
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10)),
                child: Text(e),
              );
            }).toList()),
            SizedBox(
              height: 5,
            ),
            UpcomingEventsSpotlightSection()
          ],
        ),
      ),
    );
  }
}
