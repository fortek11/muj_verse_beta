import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:muj_verse_beta/features/presentation/widgets/popular_events_spotlight_widget.dart';

class PopularEventSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: FirebaseFirestore.instance.collection('popular-events').get(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  final eventData = snapshot.data!.docs[index].data();
                  return PopularEventsSpotlightWidget(eventData);
                });
          } else {
            return Center(child: CircularProgressIndicator());
          }
        });
  }
}
