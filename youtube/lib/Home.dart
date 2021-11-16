import 'package:flutter/material.dart';
import 'package:youtube/CustonSearchDelegate.dart';
import 'package:youtube/telas/Biblioteca.dart';
import 'package:youtube/telas/EmAlta.dart';
import 'package:youtube/telas/Inicio.dart';
import 'package:youtube/telas/Inscricoes.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _indice = 0;
  String _query = "";
  @override
  Widget build(BuildContext context) {
    List<Widget> telas = [
      Inicio(_query),
      EmAlta(),
      Inscricoes(),
      Biblioteca(),
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.grey, opacity: 1),
        title: Image.asset(
          "images/youtube.png",
          width: 98,
          height: 22,
        ),
        actions: [
          /*
          IconButton(
              onPressed: () {
                print("Videocam");
              },
              icon: Icon(Icons.video_call)),
          IconButton(
              onPressed: () {
                print("Conta");
              },
              icon: Icon(Icons.account_circle)),*/
          IconButton(
              onPressed: () async {
                String? consulta = await showSearch(
                    context: context, delegate: CustonSearchDelegate());
                setState(() {
                  _query = consulta!;
                });
                print("Pesquisa diatada = " + consulta!);
              },
              icon: Icon(Icons.search)),
        ],
      ),
      body: Container(padding: EdgeInsets.all(16), child: telas[_indice]),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: (indice) {
          setState(() {
            _indice = indice;
          });
        },
        currentIndex: _indice,
        fixedColor: Colors.red,
        items: [
          BottomNavigationBarItem(
            //backgroundColor: Colors.orange,
            label: "Início",
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            //backgroundColor: Colors.red,
            label: "Em Alta",
            icon: Icon(Icons.whatshot),
          ),
          BottomNavigationBarItem(
            //backgroundColor: Colors.blue,
            label: "Incrições",
            icon: Icon(Icons.subscriptions),
          ),
          BottomNavigationBarItem(
            //backgroundColor: Colors.green,
            label: "Biblioteca",
            icon: Icon(Icons.folder),
          ),
        ],
        //selectedIconTheme: IconThemeData(color: Colors.blue),
        //unselectedIconTheme: IconThemeData(color: Colors.grey),
      ),
    );
  }
}
