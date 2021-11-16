import 'package:flutter/material.dart';

class Secundaria extends StatefulWidget {
  Secundaria();
  @override
  _SecundariaState createState() => _SecundariaState();
}

class _SecundariaState extends State<Secundaria> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tela Secundaria"),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        padding: EdgeInsets.all(32),
        child: Column(
          children: <Widget>[
            Text("Segunda tela!"),
            RaisedButton(
              child: Text("Ir para a primeira tela"),
              padding: EdgeInsets.all(15),
              onPressed: () {
                Navigator.pushNamed(context, "/");
              },
            )
          ],
        ),
      ),
    );
  }
}
