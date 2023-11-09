import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../features/presentation/screens/homepage_navigator.dart';
import '../features/presentation/screens/login.dart';

class Redirect extends StatelessWidget {
  const Redirect({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return HomepageNavigator();
          } else {
            return Login();
          }
        });
  }
}
