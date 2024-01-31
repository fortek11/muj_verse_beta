import 'package:flutter/material.dart';
import 'package:muj_verse_beta/core/bottom_nav.dart';
import 'package:muj_verse_beta/olx/olx_screen.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, OlxScreen.routeName);
              },
              child: Text('MUJ OLX')),
          Center(
            child: Text('homepage'),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
