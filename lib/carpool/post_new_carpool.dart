import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:muj_verse_beta/state/data_state.dart';
import 'package:muj_verse_beta/carpool/post_from_carpool_dropdown.dart';
import 'package:muj_verse_beta/carpool/post_to_carpool_dropdown.dart';

import 'package:provider/provider.dart';

class PostNewCarpoolRide extends StatelessWidget {
  static const routeName = 'postcarpool';

  TimeOfDay? time2;
  TimeOfDay? time1;
  final _key = GlobalKey<FormState>();
  Widget build(BuildContext context) {
    final carpoolState = Provider.of<DataState>(context);

    void toggleBufferTime() {
      if (carpoolState.is30minSelected) {
        if (time1!.minute >= 30) {
          time2 = time1!
              .replacing(hour: time1!.hour + 1, minute: time1!.minute - 30);
        } else {
          time2 =
              time1!.replacing(hour: time1!.hour, minute: time1!.minute + 30);
        }
      } else {
        time2 = time1!.replacing(hour: time1!.hour + 1, minute: time1!.minute);
      }

      print("time2: ${time2!.hour}:${time2!.minute.toString()}");
      carpoolState.postCarpoolTime2 = "${time2!.hour}:${time2!.minute}";
      carpoolState.notifyListeners();
    }

    return WillPopScope(
      onWillPop: () async {
        carpoolState.clearPostCarpoolData();

        return true;
      },
      child: Scaffold(
          appBar: AppBar(
            title: Text(
              'Post a New Ride',
              style: TextStyle(
                fontSize: 24,
              ),
            ),
            leading: InkWell(
              onTap: () {
                carpoolState.clearPostCarpoolData();
                Navigator.of(context).pop();
              },
              child: Container(
                  padding: const EdgeInsets.all(13),
                  margin: const EdgeInsets.only(left: 10, bottom: 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: const Color.fromARGB(255, 190, 203, 228),
                  ),
                  child: const Icon(
                    Icons.arrow_back_ios_new,
                    size: 22,
                    color: Color(0xFF1D2228),
                  )),
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 25),
                  child: Form(
                    key: _key,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Name',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.grey.shade200,
                          ),
                          child: TextFormField(
                            style: TextStyle(fontSize: 16),
                            onSaved: (newValue) {
                              carpoolState.postCarpoolName = newValue;
                            },
                            onFieldSubmitted: (value) {
                              carpoolState.postCarpoolName = value;
                            },
                            onChanged: (value) {
                              carpoolState.postCarpoolName = value;
                            },
                            validator: (value) {
                              if (value == null) {
                                return 'Name cannot be empty';
                              }
                              if (value.length < 5) {
                                return 'Please Provide full name';
                              }
                            },
                            textInputAction: TextInputAction.done,
                            decoration: InputDecoration(
                                fillColor: Colors.black,
                                hintText: "Darshan Wadhva",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15)),
                                contentPadding: EdgeInsets.all(15)),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        const Text(
                          'Location',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            PostFromCarpoolDropdown(),
                            PostToCarpoolDropdown()
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(
                          'When?',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            IntrinsicHeight(
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 15),
                                decoration: BoxDecoration(
                                    boxShadow: [],
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border.all(
                                        color: Colors.black26, width: 1.5),
                                    color: Colors.grey.shade200),
                                child: Row(
                                  children: [
                                    Text(carpoolState.postCarpoolDate == null
                                        ? 'Select a Date'
                                        : '${carpoolState.postCarpoolDate}'),
                                    SizedBox(
                                      width: 3,
                                    ),
                                    VerticalDivider(
                                      thickness: 2,
                                      endIndent: 3,
                                      indent: 3,
                                    ),
                                    InkWell(
                                        onTap: () {
                                          showDatePicker(
                                                  context: context,
                                                  initialDate: DateTime.now()
                                                      .add(Duration(days: 1)),
                                                  firstDate: DateTime.now(),
                                                  lastDate: DateTime.now()
                                                      .add(Duration(days: 7)))
                                              .then((value) {
                                            if (value == null) {
                                              return;
                                            }
                                            print(DateFormat('d/M/y')
                                                .format(value));
                                            carpoolState.postCarpoolDate =
                                                DateFormat('d/M/y')
                                                    .format(value);
                                            carpoolState.notifyListeners();
                                          });
                                        },
                                        child: Icon(
                                          Icons.date_range,
                                          color: Colors.black,
                                        )),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            IntrinsicHeight(
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 15),
                                decoration: BoxDecoration(
                                    boxShadow: [],
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border.all(
                                        color: Colors.black26, width: 1.5),
                                    color: Colors.grey.shade200),
                                child: Row(
                                  children: [
                                    Text(carpoolState.postCarpoolTime1 == null
                                        ? 'Select Time'
                                        : '${carpoolState.postCarpoolTime1} - ${carpoolState.postCarpoolTime2}'),
                                    const SizedBox(
                                      width: 3,
                                    ),
                                    const VerticalDivider(
                                      thickness: 2,
                                      endIndent: 3,
                                      indent: 3,
                                    ),
                                    InkWell(
                                        onTap: () {
                                          showTimePicker(
                                                  context: context,
                                                  initialTime: const TimeOfDay(
                                                      hour: 16, minute: 00))
                                              .then((value) {
                                            if (value == null) {
                                              return;
                                            }
                                            print(value
                                                .format(context)
                                                .toString());
                                            print(
                                                "time1: ${value.hour}:${value.minute}");
                                            time1 = value;
                                            carpoolState.postCarpoolTime1 =
                                                "${value.hour}:${value.minute}";

                                            if (value.minute >= 30) {
                                              time2 = value.replacing(
                                                  hour: value.hour + 1,
                                                  minute: value.minute - 30);
                                            } else {
                                              time2 = value.replacing(
                                                  hour: value.hour,
                                                  minute: value.minute + 30);
                                            }

                                            print(
                                                "time2: ${time2!.hour}:${time2!.minute.toString()}");
                                            carpoolState.postCarpoolTime2 =
                                                "${time2!.hour}:${time2!.minute}";
                                            carpoolState.notifyListeners();
                                          });
                                        },
                                        child: const Icon(
                                          Icons.access_time_filled,
                                          color: Colors.black,
                                        )),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              '',
                              style: TextStyle(
                                  fontSize: 15,
                                  color:
                                      const Color.fromARGB(255, 109, 109, 109)),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            InkWell(
                              splashColor: Colors.transparent,
                              onTap: () {
                                if (carpoolState.postCarpoolTime1 == null) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          content: Text(
                                              'Please select a time first')));
                                  return;
                                }
                                carpoolState.toogleBufferTime();
                                toggleBufferTime();
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Colors.grey.shade300,
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                          boxShadow: carpoolState
                                                  .is30minSelected
                                              ? [
                                                  BoxShadow(
                                                    color: Color.fromARGB(
                                                            255, 153, 153, 153)
                                                        .withOpacity(.5),
                                                    blurStyle: BlurStyle.outer,
                                                    blurRadius:
                                                        15.0, // soften the shadow

                                                    offset: Offset(
                                                      0, // Move to right 10  horizontally
                                                      0, // Move to bottom 10 Vertically
                                                    ),
                                                  )
                                                ]
                                              : null,
                                          color: carpoolState.is30minSelected
                                              ? Colors.white
                                              : Colors.transparent,
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 10, horizontal: 30),
                                      child: Text(
                                        '  30min  ',
                                        style: TextStyle(
                                            fontWeight:
                                                carpoolState.is30minSelected
                                                    ? FontWeight.bold
                                                    : FontWeight.w400,
                                            color: !carpoolState.is30minSelected
                                                ? Colors.grey.shade700
                                                : Colors.black),
                                      ),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 10, horizontal: 30),
                                      decoration: BoxDecoration(
                                          boxShadow: carpoolState
                                                  .is30minSelected
                                              ? null
                                              : [
                                                  BoxShadow(
                                                    color: Color.fromARGB(
                                                            255, 153, 153, 153)
                                                        .withOpacity(.5),
                                                    blurStyle: BlurStyle.outer,
                                                    blurRadius:
                                                        15.0, // soften the shadow

                                                    offset: Offset(
                                                      0, // Move to right 10  horizontally
                                                      0, // Move to bottom 10 Vertically
                                                    ),
                                                  )
                                                ],
                                          color: carpoolState.is30minSelected
                                              ? Colors.transparent
                                              : Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                      child: Text(
                                        '  60min  ',
                                        style: TextStyle(
                                            fontWeight:
                                                !carpoolState.is30minSelected
                                                    ? FontWeight.bold
                                                    : FontWeight.w400,
                                            color: carpoolState.is30minSelected
                                                ? Colors.grey.shade700
                                                : Colors.black),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Whatsapp Number',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.grey.shade200,
                          ),
                          child: TextFormField(
                            maxLength: 10,
                            validator: (value) {
                              if (value == null) {
                                return 'Number cannot be empty';
                              }
                              if (value.length < 10) {
                                return 'Please provide correct number';
                              }
                            },
                            keyboardType: TextInputType.number,
                            textInputAction: TextInputAction.next,
                            onSaved: (newValue) {
                              carpoolState.postCarpoolWhatsappNumber =
                                  int.parse(newValue!);
                            },
                            onFieldSubmitted: (value) {
                              carpoolState.postCarpoolWhatsappNumber =
                                  int.parse(value);
                            },
                            onChanged: (value) {
                              carpoolState.postCarpoolWhatsappNumber =
                                  int.parse(value);
                            },
                            style: TextStyle(fontSize: 16),
                            decoration: InputDecoration(
                                fillColor: Colors.black,
                                prefixText: '+91 ',
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15)),
                                contentPadding: EdgeInsets.all(15)),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Description',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.grey.shade200,
                          ),
                          child: TextFormField(
                            maxLength: 20,
                            onSaved: (newValue) {
                              carpoolState.postCarpoolDescription = newValue;
                            },
                            onFieldSubmitted: (value) {
                              carpoolState.postCarpoolDescription = value;
                            },
                            onChanged: (value) {
                              carpoolState.postCarpoolDescription = value;
                            },
                            textInputAction: TextInputAction.done,
                            keyboardType: TextInputType.multiline,
                            maxLines: 3,
                            style: TextStyle(fontSize: 16),
                            decoration: InputDecoration(
                                hintText: 'Planning to book a 5 seater cab',
                                fillColor: Colors.black,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15)),
                                contentPadding: EdgeInsets.all(15)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
              ],
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          floatingActionButton: Visibility(
            visible: MediaQuery.of(context).viewInsets.bottom == 0.0,
            child: ElevatedButton(
              onPressed: () async {
                final validate = _key.currentState!.validate();
                if (!validate) {
                  return;
                }
                if (carpoolState.postCarpoolDate == null) {
                  ScaffoldMessenger.of(context).clearSnackBars();
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text("Select a Date")));
                  return;
                }
                if (carpoolState.postCarpoolTime1 == null) {
                  ScaffoldMessenger.of(context).clearSnackBars();
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text("Select a time")));
                  return;
                }
                if (carpoolState.postFromCarpoolValue == null ||
                    carpoolState.postToCarpoolValue == null) {
                  ScaffoldMessenger.of(context).clearSnackBars();
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Select Destinations")));
                  return;
                }
                if (carpoolState.postCarpoolWhatsappNumber == null ||
                    carpoolState.postCarpoolWhatsappNumber.toString().length <
                        10) {
                  ScaffoldMessenger.of(context).clearSnackBars();
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text("Provide correct whatsapp number")));
                  return;
                }
                try {
                  carpoolState.postCarpoolData().then((value) {
                    ScaffoldMessenger.of(context)
                        .showSnackBar(SnackBar(content: Text("Ride Posted!")));
                  });
                } catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Failed: " + e.toString())));
                }
              },
              child: Text('Submit'),
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 190, 203, 228),
                  padding: const EdgeInsets.symmetric(
                      horizontal: 130, vertical: 20)),
            ),
          )),
    );
  }
}
