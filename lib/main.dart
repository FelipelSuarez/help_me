import 'package:flutter/material.dart';
import 'package:helpme/pages/screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final appTitle = 'HelpMe';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appTitle,
      home: new ScreenWidget(
        tittle: appTitle,
      ),
    );
  }
}
