import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:muj_verse_beta/features/presentation/screens/post_new_carpool.dart';
import 'package:muj_verse_beta/features/presentation/state/menu_carpool_state.dart';
import 'package:muj_verse_beta/features/presentation/widgets/carpool_result_card.dart';
import 'package:provider/provider.dart';

class CarpoolResultScreen extends StatelessWidget {
  final String from;
  final String to;
  final String dateString;
  final DateTime date;
  CarpoolResultScreen(this.from, this.to, this.date, this.dateString);

  List<String> fromAndToIcons = [
    "assets/hostel.svg",
    "assets/plane.svg",
    "assets/train.svg",
    "assets/other.svg",
  ];

  Map<String, dynamic> searchResult = {};
  Widget build(BuildContext context) {
    final carpoolState = Provider.of<DataState>(context, listen: false);
    print('${from.toLowerCase()}-${to.toLowerCase()}');
    fetchData() async {
      print('fetch data function');
      try {
        await FirebaseFirestore.instance
            .collection('${from.toLowerCase()}-${to.toLowerCase()}')
            .where("date", isEqualTo: dateString)
            .get()
            .then((value) {
          value.docs.forEach((element) {
            Map<String, dynamic> data = {
              element.reference.id: element.data() as Map<String, dynamic>,
            };
            searchResult.addAll(data);
            print(element.reference.id);
            print(element['name']);
          });
        });
        print(searchResult);
        return searchResult;
      } catch (e) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('Failed: ' + e.toString())));
      }
    }

    fetchData();

    return Scaffold(
        body: Column(
      children: [
        const SizedBox(
          height: 0,
        ),
        Card(
          elevation: 5,
          margin: const EdgeInsets.all(0),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(35),
                  bottomRight: Radius.circular(35))),
          child: Container(
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(35),
                    bottomRight: Radius.circular(35))),
            child: Stack(
              children: [
                Container(
                    height: 250,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(35),
                            bottomRight: Radius.circular(35)),
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(
                              'assets/carpool_search_poster.png',
                            )))),
                Container(
                  width: double.infinity,
                  height: 250,
                  padding: const EdgeInsets.only(top: 105, left: 20),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(35),
                        bottomRight: Radius.circular(35)),
                    color: Color.fromARGB(130, 51, 87, 131),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${from} to ${to},',
                        style:
                            const TextStyle(color: Colors.white, fontSize: 25),
                      ),
                      Text(
                        DateFormat.MMMEd().format(date),
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 21,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Positioned(
                    top: 50,
                    left: 10,
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: const Color.fromARGB(130, 216, 234, 255),
                          ),
                          child: const Icon(
                            Icons.arrow_back_ios_new,
                            size: 22,
                            color: Colors.white,
                          )),
                    )),
              ],
            ),
          ),
        ),
        FutureBuilder(
            future: fetchData(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final dataList = snapshot.data!.values.toList();
                print('list' + dataList.toString());

                if (dataList.isEmpty) {
                  return Center(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Image.asset('assets/no-carpool-rides.png'),
                        Text(
                          'Ohh Nooo! No rides found',
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                              Navigator.of(context)
                                  .pushNamed(PostNewCarpoolRide.routeName);
                            },
                            child: Text('Post a new ride'))
                      ],
                    ),
                  );
                }
                return Expanded(
                  child: ListView.builder(
                      shrinkWrap: true,
                      physics: ScrollPhysics(),
                      itemCount: dataList.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.only(bottom: 30),
                          child: CarpoolResultCard(
                              date: date,
                              name: dataList[index]['name'],
                              to: to,
                              fromIcon: fromAndToIcons[
                                  carpoolState.fromCarpoolValue!],
                              toIcon:
                                  fromAndToIcons[carpoolState.toCarpoolValue!],
                              from: from,
                              whatsappNumber: dataList[index]['whatsapp'],
                              time1: dataList[index]['time1'],
                              time2: dataList[index]['time2'],
                              description:
                                  dataList[index]['description'] ?? ''),
                        );
                      }),
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            })
      ],
    ));
  }
}
