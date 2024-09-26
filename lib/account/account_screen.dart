import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:muj_verse_beta/core/redirect.dart';

class AccountScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 250, 250, 255),
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Center(
            child: Container(
              height: 200,
              width: 200,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(70),
                  image: DecorationImage(
                      image: AssetImage(
                    'assets/darshan.jpg',
                  ))),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            'Darshan Wadhva',
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.w500),
          ),
          Text(
            FirebaseAuth.instance.currentUser!.email!.toString(),
            style: TextStyle(color: Colors.grey.shade600),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            height: 370,
            margin: EdgeInsets.symmetric(horizontal: 35),
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      color:
                          Color.fromARGB(255, 214, 214, 214).withOpacity(0.5),
                      blurRadius: 5.0,
                      spreadRadius: 2)
                ],
                border: Border.all(color: Colors.grey.shade300),
                color: Colors.white,
                borderRadius: BorderRadius.circular(15)),
            child: Column(
              children: [
                ListTile(
                  leading: Icon(
                    color: Colors.black,
                    Icons.local_taxi,
                    size: 28,
                  ),
                  title: Text('Carpool Requestes'),
                  subtitle: Text(
                    'Your carpool requests',
                    style: TextStyle(color: Colors.grey),
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 20,
                  ),
                ),
                Expanded(
                    child: Divider(
                  color: Colors.grey.shade300,
                )),
                ListTile(
                  leading: Icon(
                    color: Colors.black,
                    Icons.sell,
                    size: 28,
                  ),
                  title: Text('OLX Items'),
                  subtitle: Text(
                    'Your OLX Items',
                    style: TextStyle(color: Colors.grey),
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 20,
                  ),
                ),
                Expanded(
                    child: Divider(
                  color: Colors.grey.shade300,
                )),
                ListTile(
                  leading: Icon(
                    color: Colors.black,
                    Icons.headset_mic_sharp,
                    size: 28,
                  ),
                  title: Text('Help Center'),
                  subtitle: Text(
                    'Helpdesk and Suggestions',
                    style: TextStyle(color: Colors.grey),
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 20,
                  ),
                ),
                Expanded(
                    child: Divider(
                  color: Colors.grey.shade300,
                )),
                ListTile(
                  leading: Icon(
                    color: Colors.black,
                    Icons.info,
                    size: 28,
                  ),
                  title: Text('About Us'),
                  subtitle: Text(
                    'About Muj-Verse and team',
                    style: TextStyle(color: Colors.grey),
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 20,
                  ),
                ),
                Expanded(
                    child: Divider(
                  color: Colors.grey.shade300,
                )),
                ListTile(
                  leading: Icon(
                    Icons.find_in_page_rounded,
                    size: 28,
                    color: Colors.black,
                  ),
                  title: Text('Privacy Policy'),
                  subtitle: Text(
                    'T&C, Privacy Policy',
                    style: TextStyle(color: Colors.grey),
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 20,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          InkWell(
            onTap: () {
              FirebaseAuth.instance.signOut();
              Navigator.of(context).pushReplacementNamed(Redirect.routeName);
            },
            child: Container(
              height: 50,
              alignment: Alignment.center,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                      color:
                          Color.fromARGB(255, 240, 133, 133).withOpacity(0.5),
                      blurRadius: 10.0,
                      spreadRadius: 3)
                ],
                color: Colors.white,
              ),
              margin: EdgeInsets.symmetric(horizontal: 35),
              child: Text(
                "Logout",
                style: TextStyle(
                    color: const Color.fromARGB(255, 235, 135, 135),
                    fontSize: 20),
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
        ]),
      ),
    );
  }
}
