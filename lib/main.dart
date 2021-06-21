import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'list.dart';
import 'initialize.dart';
import 'splash.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
