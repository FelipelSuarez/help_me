import 'package:flutter/material.dart';
import 'drawer.dart';

class ScreenWidget extends StatefulWidget {

  final Function onTap;
  final String tittle;

  const ScreenWidget({Key key, this.onTap, this.tittle}) : super(key: key);

  @override
  _DrawerWidgetState createState() => new _DrawerWidgetState();
}

class _DrawerWidgetState extends State<ScreenWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.tittle),
        leading: GestureDetector(
            onTap: widget.onTap,
            child: Icon(Icons.menu)),
      ),
      body: Center(
        child: Text("Tela Inicial"),
      ),
    );
  }
}