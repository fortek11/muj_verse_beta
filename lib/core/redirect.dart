import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:muj_verse_beta/login%20screen/new_initial.dart';

import 'homepage_navigator.dart';

class Redirect extends StatelessWidget {
  const Redirect({super.key});

  static const routeName = 'redirect';

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return HomepageNavigator();
          } else {
            return NewInitialScreen();
          }
        });
  }
}
