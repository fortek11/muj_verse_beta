import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DataState with ChangeNotifier {
  final List destinationNames = ['Hostel', 'Airport', 'Station', 'Other'];
  bool isLoading = false;
  void toogleLoading() {
    isLoading = !isLoading;
    notifyListeners();
  }

  int? fromCarpoolValue;
  int? toCarpoolValue;
  int FindCarpoolDateIndex = 0;

  void changeCarpoolFindDateTo(int index) {
    FindCarpoolDateIndex = index;
    notifyListeners();
  }

  void changeFromCarpoolValue(int value) {
    fromCarpoolValue = value;
    notifyListeners();
  }

  void changeToCarpoolValue(int value) {
    toCarpoolValue = value;
    notifyListeners();
  }

  List outlets = [];
  Map restaurantData = {};
  Future<List> getOutlets() async {
    if (outlets.isNotEmpty) {
      return outlets;
    } else {
      final snapshot =
          await FirebaseFirestore.instance.collection('outlets').get();
      int outletCount = snapshot.docs.length;
      for (int i = 0; i < outletCount; i++) {
        outlets.add(snapshot.docs[i].id);
      }
      return outlets;
    }
  }

  Map eventCategories = {
    'Music': Icons.music_note,
    'Tech': Icons.data_object_rounded,
    'Business': Icons.business_center_outlined,
    'Aptitude': Icons.precision_manufacturing_outlined,
    'Sport': Icons.sports_soccer,
    'Dance': Icons.people
  };

  Future<Map> getMenuDetails(String outletName) async {
    try {
      if (restaurantData.keys.contains(outletName)) {
        print('done');
        return restaurantData[outletName];
      } else {
        final snapshot = await FirebaseFirestore.instance
            .collection('outlets')
            .doc(outletName)
            .get();

        Map<String, dynamic> data = {
          outletName: snapshot.data() as Map<String, dynamic>,
        };

        print(data);
        restaurantData.addAll(data);
        print('menuDetail = ' + restaurantData.toString());

        return restaurantData[outletName];
      }
    } catch (e) {
      print(e);
      return restaurantData[outletName];
    }
  }

  int? postFromCarpoolValue;
  int? postToCarpoolValue;
  String? postCarpoolDate;
  String? postCarpoolTime1;
  String? postCarpoolTime2;
  int? postCarpoolWhatsappNumber;
  String? postCarpoolDescription;
  String? postCarpoolName;

  Future postCarpoolData() async {
    await FirebaseFirestore.instance
        .collection(
            '${destinationNames[postFromCarpoolValue!].toLowerCase()}-${destinationNames[postToCarpoolValue!].toLowerCase()}')
        .add({
      'date': postCarpoolDate,
      'description': postCarpoolDescription,
      'name': postCarpoolName,
      'time1': postCarpoolTime1,
      'time2': postCarpoolTime2,
      'whatsapp': postCarpoolWhatsappNumber
    }).then((value) => print(value.id));
    //.doc('${postCarpoolDate} , ${postCarpoolTime1}')
  }

  bool is30minSelected = true;

  void toogleBufferTime() {
    is30minSelected = !is30minSelected;

    notifyListeners();
  }

  void clearPostCarpoolData() {
    postFromCarpoolValue = null;
    postToCarpoolValue = null;
    postCarpoolDate = null;
    postCarpoolTime1 = null;
    postCarpoolTime2 = null;
    postCarpoolWhatsappNumber = null;
    postCarpoolDescription = null;
    postCarpoolName = null;
  }

  void clearCarpoolSearchData() {
    fromCarpoolValue = null;
    toCarpoolValue = null;
    FindCarpoolDateIndex = 0;
  }
}
