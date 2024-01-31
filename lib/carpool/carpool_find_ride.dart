import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:muj_verse_beta/carpool/carpool_result_screen.dart';
import 'package:muj_verse_beta/state/data_state.dart';
import 'package:muj_verse_beta/carpool/date_timeline_carpool.dart';
import 'package:muj_verse_beta/carpool/search_from_carpool_dropdown.dart';

import 'package:muj_verse_beta/carpool/search_to_carpool_dropdown.dart';
import 'package:provider/provider.dart';

class CarpoolFindRide extends StatelessWidget {
  final List destinationNames = ['Hostel', 'Airport', 'Station', 'Other'];
  Widget build(BuildContext context) {
    final carpoolState = Provider.of<DataState>(context);

    void onSearch() {
      if (carpoolState.fromCarpoolValue == null ||
          carpoolState.toCarpoolValue == null) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('Invalid Search')));
        return;
      }
      Navigator.of(context).push(MaterialPageRoute(builder: (context) {
        return CarpoolResultScreen(
            destinationNames[carpoolState.fromCarpoolValue!],
            destinationNames[carpoolState.toCarpoolValue!],
            DateTime.now()
                .add(Duration(days: carpoolState.FindCarpoolDateIndex)),
            DateFormat('d/M/y').format(
              DateTime.now()
                  .add(Duration(days: carpoolState.FindCarpoolDateIndex)),
            ));
      }));
    }

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
      elevation: 10,
      color: const Color(0xFF1D2228),
      surfaceTintColor: Colors.transparent,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: 10,
                ),
                Image.asset(
                  'assets/carpool_search.png',
                  height: 160,
                ),
                const SizedBox(
                  width: 30,
                ),
                Container(
                  height: 160,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'From:',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                      SearchFromDropdownCarpool(),
                      const SizedBox(
                        width: 10,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text(
                        'To:',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                      SearchToDropdownCarpool(),
                    ],
                  ),
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            const Divider(),
            DateTimelineCarpool(),
            const SizedBox(
              height: 25,
            ),
            ElevatedButton(
                onPressed: () {
                  onSearch();
                },
                child: Text('Search', style: TextStyle(fontSize: 17)),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(242, 255, 255, 255),
                    elevation: 5,
                    surfaceTintColor: Colors.transparent,
                    shadowColor: Color.fromARGB(143, 255, 255, 255),
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 120),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)))),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
