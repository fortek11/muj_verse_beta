import 'package:flutter/material.dart';
import 'package:muj_verse_beta/login%20screen/create_account.dart';
import 'package:muj_verse_beta/login%20screen/login_screen.dart';

class NewInitialScreen extends StatelessWidget {
  static const routeName = 'newinitialscreen';
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.sizeOf(context).height;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 250, 250, 255),
      body: Column(
        children: [
          SizedBox(
            height: 100,
          ),
          SizedBox(
            height: screenHeight - 100,
            child: Stack(
              children: [
                SizedBox(
                    height: 400,
                    child: Image.asset(
                      'assets/dome.png',
                      fit: BoxFit.cover,
                    )),
                Positioned(
                  bottom: screenHeight - 500,
                  left: 0,
                  right: 0,
                  child: Container(
                    height: 150,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [
                              const Color.fromARGB(10, 255, 255, 255),
                              const Color.fromARGB(43, 255, 255, 255),
                              const Color.fromARGB(82, 255, 255, 255),
                              const Color.fromARGB(202, 255, 255, 255),
                              Colors.white,
                              Colors.white
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            stops: [0.1, 0.4, 0.55, 0.71, 0.76, 1])),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    padding: EdgeInsets.all(15),
                    height: screenHeight - 480,
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 41, 51, 65),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(50),
                            topRight: Radius.circular(50))),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 50,
                        ),
                        Text(
                          'MUJ VERSE',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Your connected college experience',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        SizedBox(
                          width: MediaQuery.sizeOf(context).width,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.of(context)
                                  .pushNamed(CreateAccountScreen.routeName);
                            },
                            child: Text('Create Account'),
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                elevation: 5,
                                shadowColor: Colors.white.withOpacity(0.35),
                                padding: EdgeInsets.symmetric(vertical: 15)),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        SizedBox(
                          width: MediaQuery.sizeOf(context).width,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.pushReplacement(context,
                                  MaterialPageRoute(builder: (context) {
                                return LoginScreen();
                              }));
                            },
                            child: Text('Login'),
                            style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.symmetric(vertical: 15),
                                foregroundColor: Colors.white,
                                backgroundColor: Colors.transparent,
                                surfaceTintColor: Colors.transparent,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    side: BorderSide(
                                        color: Colors.white, width: 0.8))),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Center(
                          child: Text(
                            'Terms and Conditions',
                            style: TextStyle(color: Colors.grey.shade200),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
