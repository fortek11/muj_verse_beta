import 'package:flutter/material.dart';
import 'package:muj_verse_beta/features/presentation/screens/event_spotlight_screen.dart';
import 'package:muj_verse_beta/features/presentation/screens/homepage.dart';

import 'package:provider/provider.dart';

import '../state/nav_state.dart';
import 'carpool_screen.dart';
import 'menu_screen.dart';

class HomepageNavigator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final navProvider = Provider.of<ProviderNav>(context);

    List<Widget> _pagesList = [
      MenuScreen(),
      CarPoolScreen(),
      Homepage(),
      EventSpotlightScreen(),
      MenuScreen(),
    ];

    return _pagesList[navProvider.pageIndex];
  }
}
