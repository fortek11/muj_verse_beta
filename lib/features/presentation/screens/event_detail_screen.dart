import 'package:flutter/material.dart';

class EventDetailScreen extends StatelessWidget {
  static const routeName = 'eventdetailscreen';
  @override
  Widget build(BuildContext context) {
    final eventData =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    return Scaffold(
      body: Column(
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
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.calendar_month,
                      size: 20,
                      color: Colors.grey.shade500,
                    ),
                    SizedBox(
                      width: 3.5,
                    ),
                    Text(
                      eventData['date'],
                      style: TextStyle(color: Colors.grey.shade500),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Icon(
                      Icons.remove_red_eye,
                      size: 20,
                      color: Colors.grey.shade500,
                    ),
                    SizedBox(
                      width: 3.5,
                    ),
                    Text(
                      eventData['interested'].toString(),
                      style: TextStyle(color: Colors.grey.shade500),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.location_on,
                      size: 20,
                      color: Colors.grey.shade500,
                    ),
                    SizedBox(
                      width: 3.5,
                    ),
                    Text(
                      eventData['location'] ?? '',
                      style: TextStyle(color: Colors.grey.shade500),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  'Description',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                Text(
                  maxLines: 10,
                  '${eventData['description']}',
                  style: TextStyle(fontSize: 16),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
