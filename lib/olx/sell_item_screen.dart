import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:muj_verse_beta/olx/dropdown_widget.dart';
import 'package:muj_verse_beta/state/data_state.dart';
import 'package:provider/provider.dart';

class SellItemOlxScreen extends StatelessWidget {
  static const routeName = 'sellitemolxscreen';
  final _key = GlobalKey<FormState>();
  String? fullName;
  String? productTitle;
  String? phoneNumber;
  bool? isWhatsappSame;

  String? price;
  String? description;
  String? imageUrl;

  @override
  Widget build(BuildContext context) {
    final dataState = Provider.of<DataState>(context);
    submitData() async {
      final validate = _key.currentState!.validate();
      if (!validate) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Please fill the provided data correctly'),
        ));

        return;
      }
      if (dataState.sellOLXItemCategory == null) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Please select a category'),
        ));
        return;
      }
      if (dataState.isSellOlxImagePicked == false) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Please pick an image'),
        ));
        return;
      }
      showDialog(
          context: context,
          builder: (_) {
            return Dialog(
                child: Container(
                    alignment: Alignment.center,
                    height: 200,
                    width: 300,
                    child: CircularProgressIndicator()));
          });

      final storageRef = FirebaseStorage.instance
          .ref()
          .child('olx')
          .child('${dataState.sellOlxPickedImage!.name}');
      try {
        await storageRef
            .putFile(File(dataState.sellOlxPickedImage!.path))
            .then((p0) async {
          imageUrl = await storageRef.getDownloadURL();
          await FirebaseFirestore.instance.collection('olx').add({
            'fullname': fullName,
            'title': productTitle,
            'price': price,
            'phone': phoneNumber,
            'whatsapp': phoneNumber,
            'category': dataState.sellOLXItemCategory,
            'image': imageUrl,
            'description': description,
          }).then((value) {
            Navigator.of(context).pop();
            showDialog(
                context: context,
                builder: (_) {
                  return AlertDialog(
                    content: Text('Yay, Item Uploaded!'),
                    actions: [
                      TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text('OK'))
                    ],
                  );
                });

            print('done');
          });
        });
      } catch (e) {
        Navigator.of(context).pop();
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('error' + e.toString()),
        ));
        print('error:' + e.toString());
      }
    }

    void _pickimage() async {
      dataState.sellOlxPickedImage = await ImagePicker().pickImage(
          source: ImageSource.gallery, imageQuality: 40, maxWidth: 450);

      if (dataState.sellOlxPickedImage == null) {
        return;
      }
      dataState.toogleOlxImagePicked(true);
    }

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 243, 245, 250),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 243, 245, 250),
        title: Text('Sell Item'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Form(
              key: _key,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Full Name',
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.grey.shade800,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (fullName == null || fullName!.isEmpty) {
                        return 'Invalid Input: should contain name and surname';
                      }
                      if (fullName!.length < 5) {
                        return 'Invalid Input: should contain name and surname';
                      }

                      // Check for valid name format (e.g., at least two words separated by space)
                      final nameParts = fullName!.split(' ');
                      if (nameParts.length < 2) {
                        return 'Please enter a valid full name (first and last name)';
                      }
                    },
                    onSaved: (newValue) {
                      fullName = newValue;
                    },
                    onFieldSubmitted: (value) {
                      fullName = value;
                    },
                    onChanged: (value) {
                      fullName = value;
                    },
                    keyboardType: TextInputType.name,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                        hintText: 'Om Rajdeo',
                        hintStyle: TextStyle(color: Colors.grey.shade400),
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding: EdgeInsets.symmetric(horizontal: 10),
                        border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(10))),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Product Title',
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.grey.shade800,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (productTitle == null || productTitle!.isEmpty) {
                        return 'Invalid Input: should contain product name';
                      }
                      if (productTitle!.length < 5) {
                        return 'Invalid Input: minimum 5 characters allowed';
                      }
                    },
                    onSaved: (newValue) {
                      productTitle = newValue;
                    },
                    onFieldSubmitted: (value) {
                      productTitle = value;
                    },
                    onChanged: (value) {
                      productTitle = value;
                    },
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                        hintText: 'Oneplus 9 pro',
                        hintStyle: TextStyle(color: Colors.grey.shade400),
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding: EdgeInsets.symmetric(horizontal: 10),
                        border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(10))),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Price',
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.grey.shade800,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (price == null || price!.isEmpty) {
                        return 'Invalid Input: should contain product price';
                      }

                      final pricePared = double.tryParse(price!);
                      if (pricePared == null) {
                        return 'Please enter a valid number';
                      }

                      // Additional validations as needed, e.g.:
                      if (pricePared <= 0) {
                        return 'Price must be greater than 0';
                      }
                    },
                    onSaved: (newValue) {
                      price = newValue;
                    },
                    onFieldSubmitted: (value) {
                      price = value;
                    },
                    onChanged: (value) {
                      price = value;
                    },
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        prefixText: '₹ ',
                        labelText: ' ₹ 1000',
                        labelStyle: TextStyle(color: Colors.grey.shade400),
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding: EdgeInsets.symmetric(horizontal: 10),
                        border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(10))),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Phone Number',
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.grey.shade800,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (phoneNumber == null || phoneNumber!.isEmpty) {
                        return 'Invalid Input: should contain your phone number';
                      }
                      if (phoneNumber!.length != 10) {
                        return 'Invalid Input: 10 digits not found';
                      }
                    },
                    onSaved: (newValue) {
                      phoneNumber = newValue;
                    },
                    onFieldSubmitted: (value) {
                      phoneNumber = value;
                    },
                    onChanged: (value) {
                      phoneNumber = value;
                    },
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.number,
                    maxLength: 10,
                    decoration: InputDecoration(
                        prefixText: '+91 ',
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        labelText: ' 7558237111',
                        labelStyle: TextStyle(color: Colors.grey.shade400),
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding: EdgeInsets.symmetric(horizontal: 10),
                        border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(10))),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Same Whatsapp Number',
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.grey.shade800,
                            fontWeight: FontWeight.w600),
                      ),
                      Switch(
                        value: true,
                        onChanged: (value) {},
                        activeColor: Colors.green,
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Description',
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.grey.shade800,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (description == null || description!.isEmpty) {
                        return 'Invalid Input: should contain product description';
                      }
                      if (description!.length < 10) {
                        return 'Description too Short';
                      }
                    },
                    onSaved: (newValue) {
                      description = newValue;
                    },
                    onFieldSubmitted: (value) {
                      description = value;
                    },
                    onChanged: (value) {
                      description = value;
                    },
                    textInputAction: TextInputAction.newline,
                    maxLines: 6,
                    keyboardType: TextInputType.multiline,
                    decoration: InputDecoration(
                        hintText:
                            '- Asus Tuf 4800h Ryzen 7\n- 8,512\n- Used 1 year\n- Charger and Box included\n- Warranty Valid for more 6 months',
                        hintStyle: TextStyle(color: Colors.grey.shade400),
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                        border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(10))),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding:
                            EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                        shape: RoundedRectangleBorder(
                            side: BorderSide(
                                color: const Color.fromARGB(255, 41, 51, 65)),
                            borderRadius: BorderRadius.circular(10)),
                      ),
                      onPressed: () {
                        _pickimage();
                      },
                      child: !dataState.isSellOlxImagePicked
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.image,
                                  size: 28,
                                ),
                                Text(
                                  ' Upload Image',
                                  style: TextStyle(fontSize: 17),
                                )
                              ],
                            )
                          : Column(
                              children: [
                                Text('Tap To Change'),
                                SizedBox(
                                  height: 10,
                                ),
                                Center(
                                  child: Image.file(
                                      File(dataState.sellOlxPickedImage!.path),
                                      height: 200),
                                ),
                              ],
                            )),
                  SizedBox(
                    height: 10,
                  ),
                  CustomDropdown(),
                  SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    width: MediaQuery.sizeOf(context).width - 20,
                    child: DecoratedBox(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            gradient: const LinearGradient(
                                transform: GradientRotation(5),
                                colors: [
                                  const Color.fromARGB(255, 41, 51, 65),
                                  Color.fromARGB(255, 59, 67, 82)
                                ])),
                        child: ElevatedButton(
                            style: ButtonStyle(
                                elevation: MaterialStateProperty.all(2),
                                alignment: Alignment.center,
                                padding: MaterialStateProperty.all(
                                    const EdgeInsets.only(
                                        right: 75,
                                        left: 75,
                                        top: 15,
                                        bottom: 15)),
                                backgroundColor: MaterialStateProperty.all(
                                    Colors.transparent),
                                shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15)),
                                )),
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (_) {
                                    return AlertDialog(
                                      title: Text('Confirm upload?'),
                                      content: Text(
                                        "Please re-check the submitted data. Irrelivent or any informal actions wont be tolerated.",
                                      ),
                                      actions: [
                                        TextButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: Text('Cancel')),
                                        TextButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                              submitData();
                                            },
                                            child: Text('Confirm  ')),
                                      ],
                                    );
                                  });

                              //submitData();
                            },
                            child: const Text(
                              "Submit",
                              style: TextStyle(
                                  color: Color(0xffffffff), fontSize: 17),
                            ))),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
