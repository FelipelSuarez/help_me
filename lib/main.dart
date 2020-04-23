import 'package:flutter/material.dart';
import 'package:helpme/pages/start.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final appTitle = 'HelpMe';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appTitle,
      home: new Start(),
    );
  }
}
