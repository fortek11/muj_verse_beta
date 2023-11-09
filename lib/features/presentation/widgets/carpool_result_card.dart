import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

class CarpoolResultCard extends StatelessWidget {
  final String from;
  final String to;
  final String name;
  final int whatsappNumber;
  final String time1;
  final String time2;
  final String description;
  final DateTime date;
  final String fromIcon;
  final String toIcon;
  CarpoolResultCard(
      {required this.name,
      required this.to,
      required this.from,
      required this.whatsappNumber,
      required this.time1,
      required this.time2,
      required this.date,
      required this.fromIcon,
      required this.toIcon,
      required this.description});

  final List avatarList = [
    'avatars/avatar1.jpg',
    'avatars/avatar2.jpg',
    'avatars/avatar3.jpg',
    'avatars/avatar4.jpg',
    'avatars/avatar5.jpg',
    'avatars/avatar6.jpg',
  ];
  Random random = new Random();
  @override
  Widget build(BuildContext context) {
    openwhatsapp() async {
      var whatsapp = "+91$whatsappNumber";
      var whatsappURl =
          "whatsapp://send?phone=$whatsapp&text=Hello, saw your carpool request on MujVerse App.";

      try {
        launch(whatsappURl);
      } catch (e) {
        //To handle error and display error message
        print(e);
      }
    }

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(255, 153, 153, 153).withOpacity(.5),
            blurStyle: BlurStyle.outer,
            blurRadius: 15.0, // soften the shadow
            spreadRadius: 5.0, //extend the shadow
            offset: const Offset(
              0, // Move to right 10  horizontally
              0, // Move to bottom 10 Vertically
            ),
          )
        ],
      ),
      child: Card(
          surfaceTintColor: const Color.fromRGBO(0, 0, 0, 0),
          shape: const RoundedRectangleBorder(),
          elevation: 0,
          child: Container(
            padding:
                const EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Icons.access_time,
                          size: 25,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          '${time1} - ${time2}',
                          style: const TextStyle(
                              fontSize: 21, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Image.asset(
                      avatarList[random.nextInt(6)],
                      width: 45,
                    )
                  ],
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
                  child: Row(
                    children: [
                      Text(name,
                          style: const TextStyle(
                              fontSize: 16,
                              color: Color.fromARGB(255, 33, 33, 33))),
                      const SizedBox(
                        width: 5,
                      ),
                      Icon(
                        Icons.circle,
                        size: 9,
                        color: Colors.grey.shade500,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        DateFormat().add_MMMd().format(date),
                        style: const TextStyle(
                            fontSize: 16,
                            color: Color.fromARGB(255, 33, 33, 33)),
                      )
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset(
                              fromIcon,
                            ),
                            const SizedBox(
                              width: 3,
                            ),
                            Icon(
                              Icons.arrow_right_alt_sharp,
                              size: 40,
                              color: Colors.black.withOpacity(0.8),
                            ),
                            const SizedBox(
                              width: 3,
                            ),
                            SvgPicture.asset(toIcon,
                                color: Colors.grey.shade600)
                          ],
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        FittedBox(
                          child: Text(
                            description,
                            style: TextStyle(color: Colors.grey.shade800),
                          ),
                        ),
                      ],
                    ),
                    InkWell(
                      splashColor: Colors.grey,
                      onTap: () {
                        openwhatsapp();
                      },
                      child: Container(
                        width: 50,
                        padding: const EdgeInsets.symmetric(
                          vertical: 5,
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: const Color.fromARGB(255, 113, 152, 184)
                                .withOpacity(0.4)),
                        child: const Icon(
                          Icons.arrow_forward,
                          color: Color.fromARGB(255, 51, 87, 131),
                        ),
                      ),
                    )
                  ],
                ),
                // Divider(),
                // Container(
                //   width: double.infinity,
                //   color: Colors.blue.withOpacity(0.3),
                //   child: Text('Connect on whatsapp...'),
                // )
                // SizedBox(
                //   height: 5,
                // ),
                // Center(
                //   child: ElevatedButton(
                //     onPressed: () {
                //       openwhatsapp();
                //     },
                //     child: Text('Connect on Whatsapp'),
                //     style: ElevatedButton.styleFrom(
                //         elevation: 2,
                //         shape: RoundedRectangleBorder(
                //             borderRadius: BorderRadius.circular(5)),
                //         backgroundColor:
                //             const Color.fromARGB(255, 189, 218, 253),
                //         padding: const EdgeInsets.symmetric(
                //             vertical: 10, horizontal: 60)),
                //   ),
                // )
              ],
            ),
          )),
    );
  }
}
