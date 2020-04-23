import 'package:flutter/material.dart';
import 'package:helpme/drawer/drawer-blank.dart';
import 'package:helpme/drawer/drawer.dart';

class ScreenWidget extends StatefulWidget {

  final Function onTap;
  final String tittle;

  const ScreenWidget({Key key, this.onTap, this.tittle}) : super(key: key);

  @override
  _DrawerWidgetState createState() => new _DrawerWidgetState();
}

class _DrawerWidgetState extends State<ScreenWidget> with SingleTickerProviderStateMixin {
  AnimationController controller;

  Animation animationTranslate;
  Animation animationSize;
  Animation animationSizeBorder;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: Duration(milliseconds: 100), vsync: this);

    animationTranslate = Tween(begin: 0.0, end: 300.0)
        .animate(CurvedAnimation(parent: controller, curve: Curves.easeOut));
    animationTranslate.addListener(() {
      setState(() {});
    });

    animationSize = Tween(begin: 1.0, end: 0.8)
        .animate(CurvedAnimation(parent: controller, curve: Curves.easeOut));
    animationSize.addListener(() {
      setState(() {});
    });

    animationSizeBorder = Tween(begin: 0.0, end: 10.0)
        .animate(CurvedAnimation(parent: controller, curve: Curves.easeOut));
    animationSizeBorder.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  bool drawerOpen;
  void setDrawerOpened(bool isOpen) {
    drawerOpen = isOpen;
    if (!isOpen) {
      controller.reverse();
    } else {
      controller.forward();
    }
  }

  _onTapMenuItem(String tittle) {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        DrawerWidget(
          onTapItem: _onTapMenuItem,
        ),
        Transform.scale(
          scale: animationSize.value,
          child: Container(
              transform: Matrix4.identity()
                ..translate(animationTranslate.value, 0.0),
              child: ClipRRect(
                  borderRadius:
                  BorderRadius.circular(animationSizeBorder.value),
                  child: Scaffold(
                    drawerScrimColor: Colors.transparent,
                    drawer: DrawerBlankWidget(
                        callback: setDrawerOpened
                    ),
                    appBar: AppBar(
                        title: Text(widget.tittle)
                    ),
                    body: Center(
                      child: Text("Tela Inicial"),
                    ),
                  ))),
        ) //tela inicial
      ],
    );
  }
}