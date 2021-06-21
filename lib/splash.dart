import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Splash extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child:
        FractionallySizedBox(
          child: Image.asset('assets/note.png'),
          heightFactor: 0.4,
          widthFactor: 0.4,
        ),
      ),
    );
  }
}
