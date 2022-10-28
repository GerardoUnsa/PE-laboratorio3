import 'package:flutter/material.dart';
import 'package:lab3/src/tareas.dart';

void main() => runApp(App());

// Every component in Flutter is a widget
// even the whole app itself is just a widget

class App extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Tareas(),
    );
  }
}
