import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var _frase = [
    "O amor não se vê com os olhos mas com o coração.",
    "Um coração feliz é o resultado inevitável de um coração ardente de amor.",
    "Lutar pelo amor é bom, mas alcançá-lo sem luta é melhor.",
    "Cada qual sabe amar a seu modo; o modo, pouco importa; o essencial é que saiba amar."
  ];

  var _fraseGerada = "Clique abaixo para gerar uma frase!";

  void _gerarFrase() {
    var numeroSorteado = Random().nextInt(_frase.length);
    print(numeroSorteado);
    setState(() {
      _fraseGerada = _frase[numeroSorteado];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Frases do Dia"),
        backgroundColor: Colors.green[700],
      ),
      body: Center(
          child: Container(
        padding: EdgeInsets.all(16),
        /*width: double.infinity,
        decoration:
            BoxDecoration(border: Border.all(width: 3, color: Colors.amber)),*/
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.asset("images/logo.png"),
            Text(
              _fraseGerada,
              textAlign: TextAlign.justify,
              style: TextStyle(
                  fontSize: 25,
                  fontStyle: FontStyle.italic,
                  color: Colors.black),
            ),
            RaisedButton(
              onPressed: _gerarFrase,
              child: Text(
                "Nova Frase",
                style: TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              color: Colors.green,
            )
          ],
        ),
      )),
    );
  }
}
