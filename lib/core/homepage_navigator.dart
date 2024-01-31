import 'package:flutter/material.dart';
import 'package:muj_verse_beta/event/event_spotlight_screen.dart';
import 'package:muj_verse_beta/core/homepage.dart';
import 'package:muj_verse_beta/olx/olx_screen.dart';

import 'package:provider/provider.dart';

import '../state/nav_state.dart';
import '../carpool/carpool_screen.dart';
import '../menu/menu_screen.dart';

class HomepageNavigator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final navProvider = Provider.of<ProviderNav>(context);

    List<Widget> _pagesList = [
      MenuScreen(),
      CarPoolScreen(),
      Homepage(),
      EventSpotlightScreen(),
      OlxScreen(),
    ];

    return _pagesList[navProvider.pageIndex];
  }
}
