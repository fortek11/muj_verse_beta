import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:muj_verse_beta/login%20screen/new_initial.dart';

class CreateAccountScreen extends StatelessWidget {
  String? email;
  String? password;
  static const routeName = 'createaccountscreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 250, 250, 255),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 320,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                            'assets/create_account_page.png',
                          ),
                          fit: BoxFit.cover)),
                ),
                Positioned(
                    top: 35,
                    left: 20,
                    child: InkWell(
                      onTap: () {
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) {
                          return NewInitialScreen();
                        }));
                      },
                      splashColor: Colors.white,
                      child: Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                    )),
                Positioned(
                    top: 135,
                    left: 20,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Please Create\nYour Account ',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          height: 7,
                        ),
                        Text(
                          '(This is easier than adulting, we promise) ',
                          style: TextStyle(
                              color: Colors.grey.shade300, fontSize: 15),
                        ),
                      ],
                    )),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 250, 250, 255),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(45),
                            topRight: Radius.circular(45))),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 40,
            ),
            Form(
                child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35),
              child:
                  Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
                TextFormField(
                  validator: (value) {
                    // if (email == null || email!.isEmpty) {
                    //   return 'Invalid Input: should contain name and surname';
                    // }
                    // if (email!.length < 5) {
                    //   return 'Invalid Input: should contain name and surname';
                    // }

                    // Check for valid name format (e.g., at least two words separated by space)
                    // final nameParts = fullName!.split(' ');
                    // if (nameParts.length < 2) {
                    //   return 'Please enter a valid full name (first and last name)';
                    // }
                  },
                  // onSaved: (newValue) {
                  //   email = newValue;
                  // },
                  // onFieldSubmitted: (value) {
                  //   email = value;
                  // },
                  // onChanged: (value) {
                  //   email = value;
                  // },
                  keyboardType: TextInputType.name,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.person,
                        color: Colors.grey.shade400,
                      ),
                      hintText: 'Name',
                      hintStyle: TextStyle(color: Colors.grey.shade400),
                      filled: true,
                      fillColor: Color.fromARGB(255, 240, 240, 240),
                      contentPadding: EdgeInsets.symmetric(horizontal: 10),
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(10))),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  validator: (value) {
                    // if (fullName == null || fullName!.isEmpty) {
                    //   return 'Invalid Input: should contain name and surname';
                    // }
                    // if (fullName!.length < 5) {
                    //   return 'Invalid Input: should contain name and surname';
                    // }

                    // // Check for valid name format (e.g., at least two words separated by space)
                    // final nameParts = fullName!.split(' ');
                    // if (nameParts.length < 2) {
                    //   return 'Please enter a valid full name (first and last name)';
                    // }
                  },
                  // onSaved: (newValue) {
                  //   password = newValue;
                  // },
                  // onFieldSubmitted: (value) {
                  //   password = value;
                  // },
                  // onChanged: (value) {
                  //   password = value;
                  // },
                  keyboardType: TextInputType.name,
                  textInputAction: TextInputAction.next,
                  obscureText: true,
                  decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.email_outlined,
                        color: Colors.grey.shade400,
                      ),
                      hintText: 'Email',
                      hintStyle: TextStyle(color: Colors.grey.shade400),
                      filled: true,
                      fillColor: Color.fromARGB(255, 240, 240, 240),
                      contentPadding: EdgeInsets.symmetric(horizontal: 10),
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(10))),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  validator: (value) {
                    // if (email == null || email!.isEmpty) {
                    //   return 'Invalid Input: should contain name and surname';
                    // }
                    // if (email!.length < 5) {
                    //   return 'Invalid Input: should contain name and surname';
                    // }

                    // Check for valid name format (e.g., at least two words separated by space)
                    // final nameParts = fullName!.split(' ');
                    // if (nameParts.length < 2) {
                    //   return 'Please enter a valid full name (first and last name)';
                    // }
                  },
                  onSaved: (newValue) {
                    email = newValue;
                  },
                  onFieldSubmitted: (value) {
                    email = value;
                  },
                  onChanged: (value) {
                    email = value;
                  },
                  keyboardType: TextInputType.name,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.lock_open_rounded,
                        color: const Color.fromRGBO(189, 189, 189, 1),
                      ),
                      suffixIcon: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.remove_red_eye,
                            color: Colors.grey.shade500,
                          )),
                      hintText: 'Create Password',
                      hintStyle: TextStyle(color: Colors.grey.shade400),
                      filled: true,
                      fillColor: Color.fromARGB(255, 240, 240, 240),
                      contentPadding: EdgeInsets.symmetric(horizontal: 10),
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(10))),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  validator: (value) {
                    // if (email == null || email!.isEmpty) {
                    //   return 'Invalid Input: should contain name and surname';
                    // }
                    // if (email!.length < 5) {
                    //   return 'Invalid Input: should contain name and surname';
                    // }

                    // Check for valid name format (e.g., at least two words separated by space)
                    // final nameParts = fullName!.split(' ');
                    // if (nameParts.length < 2) {
                    //   return 'Please enter a valid full name (first and last name)';
                    // }
                  },
                  onSaved: (newValue) {
                    password = newValue;
                  },
                  onFieldSubmitted: (value) {
                    password = value;
                  },
                  onChanged: (value) {
                    password = value;
                  },
                  keyboardType: TextInputType.name,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.lock,
                        color: Colors.grey.shade400,
                      ),
                      suffixIcon: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.remove_red_eye,
                            color: Colors.grey.shade500,
                          )),
                      hintText: 'Confirm Password',
                      hintStyle: TextStyle(color: Colors.grey.shade400),
                      filled: true,
                      fillColor: Color.fromARGB(255, 240, 240, 240),
                      contentPadding: EdgeInsets.symmetric(horizontal: 10),
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(10))),
                ),
                SizedBox(
                  height: 5,
                ),
              ]),
            )),
            SizedBox(
              height: 50,
            ),
            ElevatedButton(
              onPressed: () async {
                FirebaseAuth.instance
                    .createUserWithEmailAndPassword(
                        email: email!, password: password!)
                    .then((value) {})
                    .then((value) {
                  // FirebaseAuth.instance.currentUser!
                  //     .sendEmailVerification()
                  //     .catchError((e) {
                  //   print(e.toString());
                  // }).then((value) {
                  //   print('success');
                  // });
                });
              },
              child: Text('Create Account'),
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      15,
                    ),
                  ),
                  elevation: 1,
                  backgroundColor: Color.fromARGB(255, 41, 51, 65),
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 120)),
            ),
          ],
        ),
      ),
    );
  }
}
