import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:muj_verse_beta/features/presentation/screens/event_detail_screen.dart';
import 'package:muj_verse_beta/features/presentation/widgets/tags_scrollable_row_on_spotlight.dart';

class UpcomingEventsSpotlightSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: FirebaseFirestore.instance.collection('upcoming-events').get(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  final eventData = snapshot.data!.docs[index].data();
                  final tagList = eventData['tags'];

                  print(tagList);
                  return InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, EventDetailScreen.routeName,
                          arguments: eventData);
                    },
                    child: Container(
                      width: double.infinity,
                      height: 118,
                      margin: const EdgeInsets.only(
                          left: 6, top: 5, bottom: 5, right: 16),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white),
                      padding: const EdgeInsets.all(8),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 100,
                            width: 100,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(eventData['image']),
                                    fit: BoxFit.cover),
                                borderRadius: BorderRadius.circular(10)),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          SizedBox(
                            height: 100,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      eventData['date'],
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w700,
                                          color: Color.fromARGB(
                                              255, 106, 131, 161)),
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Icon(
                                      Icons.circle,
                                      color: const Color.fromARGB(
                                              255, 130, 153, 179)
                                          .withOpacity(1),
                                      size: 4,
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                        '${eventData['interested']} Interested',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            color: Color.fromARGB(
                                                255, 130, 153, 179))),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Icon(
                                      Icons.circle,
                                      color: const Color.fromARGB(
                                              255, 130, 153, 179)
                                          .withOpacity(1),
                                      size: 4,
                                    ),
                                    const SizedBox(
                                      width: 3,
                                    ),
                                    Text('₹ ' + eventData['price'].toString(),
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            color: Color.fromARGB(
                                                255, 130, 153, 179))),
                                  ],
                                ),
                                SizedBox(
                                  height: 2.5,
                                ),
                                SizedBox(
                                  width: MediaQuery.sizeOf(context).width - 185,
                                  child: Text(
                                    eventData['title'],
                                    maxLines: 2,
                                    textDirection: TextDirection.ltr,
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 18),
                                  ),
                                ),
                                SizedBox(
                                  height: 2.5,
                                ),
                                SizedBox(
                                    width:
                                        MediaQuery.sizeOf(context).width - 180,
                                    height: 22,
                                    child: TagsRowSectionOnSpotlightScreen(
                                        tagList)),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                });
          } else {
            return Center(child: const CircularProgressIndicator());
          }
        });
  }
}
