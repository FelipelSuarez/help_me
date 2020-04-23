import 'package:flutter/material.dart';

class DrawerWidget extends StatefulWidget {

  final Function onTapItem;

  const DrawerWidget({Key key, this.onTapItem}) : super(key: key);

  @override
  _DrawerWidgetState createState() => new _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
//identifica qual item foi selecionado
  int itemSelect = 0;

//Cria uma listview com os itens do menu
  Widget _listMenu() {
    return ListView(
      children: <Widget>[
        _avatar(), // adiciona o avatar
        _tiles("INÍCIO", Icons.home, 0, () {}),
        _tiles("HISTÓRICO", Icons.history, 1, () {}),
        Divider(),
        _tiles("CONFIGURAÇÕES", Icons.settings, 2, () {}),

      ],
    );
  }

//cria cada item do menu
  Widget _tiles(String text, IconData icon, int item, Function onTap) {
    return ListTile(
      leading: Icon(icon),
      onTap: () {
        itemSelect = item;
        Navigator.pop(context);
      },
      selected: item == itemSelect,
      title: Text(
        text,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.amber,
          child: _listMenu()),
    );
  }

  //cria o avatar com nome, email e imagem
  Widget _avatar() {
    return Padding(
      padding: EdgeInsets.all(18.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          CircleAvatar(
            backgroundColor: Colors.brown.shade800,
            child: Text('FS'),
          ),
          Container(height: 12.0,),
          Text("Felipe Suarez", style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.black54),),
          Text("felipe_lsuarez@icloud.com"),
        ],
      ),
    );
  }
}