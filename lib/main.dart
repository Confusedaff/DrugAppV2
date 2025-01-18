import 'package:drugapp/pages/scanpage.dart';
import 'package:drugapp/pages/startpage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:drugapp/Themes/themeprovider.dart';
import 'package:drugapp/drawer/aboutuspage.dart';
import 'package:drugapp/drawer/accountpage.dart';
import 'package:drugapp/drawer/doctorpage.dart';
import 'package:drugapp/drawer/settingspage.dart';
import 'package:drugapp/firebase_options.dart';
import 'package:drugapp/pages/homepage.dart';
import 'package:drugapp/pages/loginpage.dart';
import 'package:drugapp/pages/registerpage.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  await Supabase.initialize(
    url: 'https://beuvlqdiresecqdxvclx.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImJldXZscWRpcmVzZWNxZHh2Y2x4Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzYyNzE1MzcsImV4cCI6MjA1MTg0NzUzN30.4phfidHHuBhtC0LpLGfsFq6tabVSIMfox-2ftkf3yQE',
  );

  runApp(
    ChangeNotifierProvider(
      create: (context) => Themeprovider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Startpage(), //AuthGate(),
      theme: Provider.of<Themeprovider>(context).themeData,
      routes: {
        '/drawer/accountpage': (context) => const Accountpage(),
        '/drawer/settingspage': (context) => const Settingspage(),
        '/drawer/doctorpage': (context) => const Doctorpage(),
        '/drawer/aboutuspage': (context) => const Aboutuspage(),
        '/drawer/registerpage': (context) => const Registerpage(),
        '/loginpage': (context) => Loginpage(),
        '/homepage': (context) => Homepage(),
        '/scanpage': (context) => ScanPage(),
      },
    );
  }
}
