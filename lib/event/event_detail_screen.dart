import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:muj_verse_beta/event/event_detail_contact.dart';
import 'package:muj_verse_beta/event/event_detail_timeline.dart';

class EventDetailScreen extends StatelessWidget {
  static const routeName = 'eventdetailscreen';
  @override
  Widget build(BuildContext context) {
    final eventData =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final List descriptionArray = eventData['description'];
    final Map<String, dynamic> perksMap = eventData['prize'];
    final screenWidth = MediaQuery.sizeOf(context).width;
    final prizeWidgetWidth = (screenWidth - 100) / perksMap.entries.length;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 300,
                  width: double.infinity,
                  decoration: const BoxDecoration(),
                  child: Image.network(
                    eventData['image'],
                    fit: BoxFit.fill,
                  ),
                ),
                Positioned(
                    top: 45,
                    left: 20,
                    child: CircleAvatar(
                      maxRadius: 18,
                      backgroundColor: Colors.grey,
                      child: IconButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          icon: const Icon(
                            Icons.arrow_back_ios_rounded,
                            size: 19,
                          )),
                    )),
                Positioned(
                  bottom: 0,
                  child: Container(
                    height: 20,
                    width: MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20))),
                  ),
                )
              ],
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    maxLines: 2,
                    '${eventData['title']}',
                    style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.calendar_month,
                        size: 20,
                        color: Colors.grey.shade500,
                      ),
                      const SizedBox(
                        width: 3.5,
                      ),
                      Text(
                        '${DateFormat.yMMMd().format(eventData['date'].toDate())}',
                        style: TextStyle(color: Colors.grey.shade500),
                      ),
                      const SizedBox(
                        width: 30,
                      ),
                      Icon(
                        Icons.remove_red_eye,
                        size: 20,
                        color: Colors.grey.shade500,
                      ),
                      const SizedBox(
                        width: 3.5,
                      ),
                      Text(
                        eventData['interested'].toString(),
                        style: TextStyle(color: Colors.grey.shade500),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.location_on,
                        size: 20,
                        color: Colors.grey.shade500,
                      ),
                      const SizedBox(
                        width: 3.5,
                      ),
                      Text(
                        eventData['location'] ?? '',
                        style: TextStyle(color: Colors.grey.shade500),
                      ),
                      const SizedBox(
                        width: 30,
                      ),
                      Icon(
                        Icons.school,
                        size: 20,
                        color: Colors.grey.shade500,
                      ),
                      const SizedBox(
                        width: 3.5,
                      ),
                      Text(
                        eventData['club name'].toString(),
                        style: TextStyle(color: Colors.grey.shade500),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const Text(
                    'Description:',
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: descriptionArray.map((e) {
                      return Text(
                        // overflow: TextOverflow.fade,
                        '\n${e}',
                        style: TextStyle(
                            fontSize: 16, color: Colors.grey.shade700),
                      );
                    }).toList(),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const Text(
                    'Schedule:',
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  EventTimelineWidget(eventData['timeline']),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    height: 200,
                    child: Stack(
                      children: [
                        Container(
                          height: 170,
                          padding: const EdgeInsets.symmetric(
                              vertical: 12, horizontal: 10),
                          width: double.infinity,
                          margin:
                              const EdgeInsets.only(top: 20, left: 5, right: 5),
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 41, 51, 65),
                              borderRadius: BorderRadius.circular(10)),
                          child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: perksMap.entries.map((e) {
                                return Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  decoration: BoxDecoration(
                                      border: BorderDirectional(
                                          end: BorderSide(
                                              color: e.key ==
                                                      perksMap.entries.last.key
                                                  ? Colors.transparent
                                                  : Colors.grey
                                                      .withOpacity(0.5)))),
                                  height: 90,
                                  width: prizeWidgetWidth,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      FittedBox(
                                        child: Text(
                                          e.value['prize'],
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 22),
                                        ),
                                      ),
                                      FittedBox(
                                        child: Text(
                                          e.value['position'],
                                          style: const TextStyle(
                                              color: Colors.grey, fontSize: 18),
                                        ),
                                      )
                                    ],
                                  ),
                                );
                              }).toList()),
                        ),
                        const Positioned(
                            left: 25,
                            child: CircleAvatar(
                              minRadius: 25,
                              child: Icon(
                                Icons.workspace_premium_outlined,
                                color: Color.fromARGB(255, 38, 50, 66),
                                size: 28,
                              ),
                            ))
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const Text(
                    'Contact:',
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  EventContactWidget(eventData['contact']),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.transparent,
        shadowColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        child: ElevatedButton(onPressed: () {}, child: const Text('Register')),
      ),
    );
  }
}
