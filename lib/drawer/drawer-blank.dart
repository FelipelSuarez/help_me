import 'package:flutter/material.dart';

class DrawerBlankWidget extends StatefulWidget {

  final DrawerCallback callback;

  const DrawerBlankWidget({Key key, this.callback}) : super(key: key);

  @override
  _DrawerBlankWidgetState createState() => new _DrawerBlankWidgetState();
}

class _DrawerBlankWidgetState extends State<DrawerBlankWidget> {

  @override
  void initState() {
    widget.callback(true);
    super.initState();
  }

  @override
  void dispose() {
    widget.callback(false);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      shadowColor: Colors.transparent,
      child: Container(
          width: 0,
          height: 0,
          color: Colors.transparent
    ));
  }
}