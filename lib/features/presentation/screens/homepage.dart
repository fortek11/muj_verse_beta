import 'package:flutter/material.dart';
import 'package:muj_verse_beta/features/presentation/widgets/bottom_nav.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('homepage'),
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
