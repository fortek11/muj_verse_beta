import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:muj_verse_beta/state/data_state.dart';
import 'package:provider/provider.dart';

class DateTimelineCarpool extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final carpoolState = Provider.of<DataState>(context);
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                    DateFormat.MMMMd().format(DateTime.now().add(Duration(
                            days: carpoolState.FindCarpoolDateIndex))) +
                        ' ,',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold)),
                Icon(
                  Icons.calendar_month,
                  size: 23,
                  color: Colors.white,
                )
              ],
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 85,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: 7,
                  itemBuilder: (context, index) {
                    final weekDay = DateTime.now().add(Duration(days: index));
                    return carpoolState.FindCarpoolDateIndex == index
                        ? InkWell(
                            splashColor: Colors.transparent,
                            onTap: () {
                              carpoolState.changeCarpoolFindDateTo(index);
                            },
                            child: Container(
                              margin: EdgeInsets.symmetric(horizontal: 2),
                              decoration: BoxDecoration(
                                  gradient: const LinearGradient(
                                      colors: [
                                        Color.fromARGB(72, 176, 178, 192),
                                        Color.fromARGB(255, 255, 255, 255),
                                      ],
                                      begin: Alignment.bottomCenter,
                                      end: Alignment.topCenter),
                                  borderRadius: BorderRadius.circular(15)),
                              width: MediaQuery.of(context).size.width * 0.11,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5),
                              height: 70,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    DateFormat.d().format(weekDay),
                                    style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  ),
                                  Text(DateFormat.E().format(weekDay),
                                      style: const TextStyle(
                                          fontSize: 15,
                                          color: Color.fromARGB(
                                              255, 255, 255, 255)))
                                ],
                              ),
                            ),
                          )
                        : InkWell(
                            borderRadius: BorderRadius.circular(15),
                            splashColor: Colors.white,
                            onTap: () {
                              carpoolState.changeCarpoolFindDateTo(index);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  color: const Color.fromARGB(5, 193, 195, 210),
                                  borderRadius: BorderRadius.circular(15)),
                              margin: const EdgeInsets.symmetric(horizontal: 2),
                              width: MediaQuery.of(context).size.width * 0.11,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5),
                              height: 80,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    DateFormat.d().format(weekDay),
                                    style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color:
                                            Color.fromARGB(255, 193, 195, 210)),
                                  ),
                                  Text(DateFormat.E().format(weekDay),
                                      style: const TextStyle(
                                          fontSize: 15,
                                          color: Color.fromARGB(
                                              128, 176, 178, 192)))
                                ],
                              ),
                            ),
                          );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
