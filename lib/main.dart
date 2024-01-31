import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:muj_verse_beta/event/all_events_screen.dart';
import 'package:muj_verse_beta/event/event_detail_screen.dart';
import 'package:muj_verse_beta/carpool/post_new_carpool.dart';
import 'package:muj_verse_beta/olx/olx_screen.dart';
import 'package:muj_verse_beta/olx/sell_item_screen.dart';
import 'package:provider/provider.dart';

import 'core/redirect.dart';
import 'menu/outlet_detail_menu.dart';
import 'state/data_state.dart';
import 'state/nav_state.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MujMenuApp());
}

class MujMenuApp extends StatelessWidget {
  const MujMenuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => DataState()),
        ChangeNotifierProvider(create: (context) => ProviderNav())
      ],
      child: MaterialApp(
        theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
                seedColor: Color(0xFF1D2228), primary: Color(0xFF1D2228)),
            useMaterial3: true,
            textTheme: GoogleFonts.montserratTextTheme()),
        home: Redirect(),
        routes: {
          OutletDetailMenu.routeName: (context) => OutletDetailMenu(),
          EventDetailScreen.routeName: (context) => EventDetailScreen(),
          AllEventsScreen.routeName: (context) => AllEventsScreen(),
          PostNewCarpoolRide.routeName: (context) => PostNewCarpoolRide(),
          OlxScreen.routeName: (context) => OlxScreen(),
          SellItemOlxScreen.routeName: (context) => SellItemOlxScreen()
        },
      ),
    );
  }
}
