import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../auth/google_auth.dart';
import '../state/data_state.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    final menuState = Provider.of<DataState>(context);
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: const AssetImage(
                'assets/cover.png',
              ),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                  const Color.fromARGB(255, 0, 0, 0).withOpacity(0.7),
                  BlendMode.darken))),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(children: [
          const Positioned(
              top: 170,
              right: 10,
              left: 10,
              height: 75,
              child: CircleAvatar(
                backgroundColor: Color.fromARGB(255, 255, 233, 203),
                child: Icon(
                  Icons.fastfood,
                  size: 45,
                  color: Color.fromARGB(225, 247, 141, 1),
                ),
              )),
          Positioned(
              top: 250,
              right: 10,
              left: 10,
              height: 75,
              child: Image.asset(
                'assets/mujmenu.png',
              )),
          Positioned(
              left: 60,
              right: 60,
              bottom: 150,
              child: ElevatedButton(
                onPressed: () async {
                  menuState.toogleLoading();
                  try {
                    await GoogleAuthServer().signInWithGoo();
                    menuState.toogleLoading();
                  } catch (e) {
                    print(e);
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Try again: ' + e.toString())));
                    menuState.toogleLoading();
                  }
                },
                style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        vertical: 12, horizontal: 15),
                    backgroundColor: Color.fromARGB(100, 255, 255, 255),
                    foregroundColor: Color.fromARGB(224, 255, 255, 255),
                    shape: RoundedRectangleBorder(
                        side: BorderSide(
                            color: Color.fromARGB(224, 255, 233, 205)
                                .withOpacity(0.3),
                            width: 5),
                        borderRadius: BorderRadius.circular(10))),
                child: menuState.isLoading
                    ? const LinearProgressIndicator(
                        color: Colors.white,
                      )
                    : const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            'Continue With Google',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          CircleAvatar(
                            backgroundColor: Color.fromARGB(150, 255, 255, 255),
                            maxRadius: 15,
                            child: Icon(
                              Icons.arrow_forward_ios_rounded,
                              color: Colors.white,
                              size: 15,
                            ),
                          )
                        ],
                      ),
              ))
        ]),
      ),
    );
  }
}
