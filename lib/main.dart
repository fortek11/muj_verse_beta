import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:muj_verse_beta/features/presentation/screens/all_events_screen.dart';
import 'package:muj_verse_beta/features/presentation/screens/event_detail_screen.dart';
import 'package:muj_verse_beta/features/presentation/screens/post_new_carpool.dart';
import 'package:provider/provider.dart';

import 'core/redirect.dart';
import 'features/presentation/screens/outlet_detail_menu.dart';
import 'features/presentation/state/menu_carpool_state.dart';
import 'features/presentation/state/nav_state.dart';
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
          // textTheme: GoogleFonts.poppinsTextTheme()
        ),
        home: Redirect(),
        routes: {
          OutletDetailMenu.routeName: (context) => OutletDetailMenu(),
          EventDetailScreen.routeName: (context) => EventDetailScreen(),
          AllEventsScreen.routeName: (context) => AllEventsScreen(),
          PostNewCarpoolRide.routeName: (context) => PostNewCarpoolRide()
        },
      ),
    );
  }
}
