import 'package:flutter/material.dart';

class EventContactWidget extends StatelessWidget {
  final Map<String, dynamic> contactData;
  EventContactWidget(this.contactData);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: contactData.entries.map((e) {
        final eachContactData = e.value as Map<String, dynamic>;
        return Container(
          margin: EdgeInsets.symmetric(vertical: 8),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                maxRadius: 20,
                child: Icon(Icons.person),
              ),
              SizedBox(
                width: 20,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    eachContactData['name'].toString(),
                    style: const TextStyle(
                        fontWeight: FontWeight.w500, fontSize: 15),
                  ),
                  Text(
                    'eachContactData[\'number\'].toString()',
                    style: TextStyle(color: Colors.grey.shade600, fontSize: 14),
                  ),
                ],
              )
            ],
          ),
        );
      }).toList(),
    );
  }
}
