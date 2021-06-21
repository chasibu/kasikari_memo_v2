import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'list.dart';
import 'initialize.dart';
import 'splash.dart';

import 'package:flutter_localizations/flutter_localizations.dart';
import 'generated/l10n.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('ja', ''),
        const Locale('en', ''),
      ],
      title: 'かしかりメモ',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: <String, WidgetBuilder>{
        '/': (BuildContext context) => Initialize(),
        '/list': (BuildContext context) => List(),
        '/splash': (BuildContext context) => Splash()
      }
    );
  }
}
