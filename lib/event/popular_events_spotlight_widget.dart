import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:muj_verse_beta/event/event_detail_screen.dart';

class PopularEventsSpotlightWidget extends StatelessWidget {
  final Map<String, dynamic> eventData;
  PopularEventsSpotlightWidget(this.eventData);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, EventDetailScreen.routeName,
            arguments: eventData);
      },
      child: Container(
        width: 260,
        margin: EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage((eventData['image'])),
              fit: BoxFit.cover,
            ),
            color: Colors.white,
            borderRadius: BorderRadius.circular(10)),
        child: Stack(
          children: [
            Positioned(
                top: 8,
                left: 8,
                child: CircleAvatar(
                  maxRadius: 18,
                  backgroundColor: Color(0xFF1D2228),
                  child: Icon(
                    Icons.abc,
                    color: Colors.white,
                  ),
                )),
            Positioned(
                top: 8,
                right: 8,
                child: CircleAvatar(
                  maxRadius: 18,
                  backgroundColor: Color(0xFF1D2228),
                  child: Icon(
                    Icons.favorite,
                    color: const Color.fromARGB(255, 244, 54, 120),
                  ),
                )),
            Positioned(
                left: 10,
                right: 10,
                bottom: 14,
                child: Container(
                  width: 200,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              eventData['title'],
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                            Row(
                              children: [
                                Text(
                                  DateFormat.yMMMd()
                                      .format(eventData['date'].toDate()),
                                  style: TextStyle(
                                      color: Colors.grey.shade700,
                                      fontSize: 12),
                                ),
                                SizedBox(
                                  width: 4,
                                ),
                                Icon(
                                  Icons.circle,
                                  color: Colors.grey.shade300,
                                  size: 8,
                                ),
                                SizedBox(
                                  width: 4,
                                ),
                                Text(
                                  eventData['club name'],
                                  style: TextStyle(
                                      color: Colors.grey.shade700,
                                      fontSize: 12),
                                ),
                              ],
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Center(
                                child: Text(
                              eventData['price'],
                              style: TextStyle(
                                  color: const Color.fromARGB(255, 46, 164, 50),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17),
                            )),
                            SizedBox(
                              width: 10,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
