import 'dart:math';

import 'package:caracoroa/Home.dart';
import 'package:flutter/material.dart';

class Resultado extends StatefulWidget {
  var escolhaJogador;
  var moeda;

  Resultado(this.escolhaJogador) {
    var _resultado = Random().nextInt(1);

    print("JOGADOR ESCOLHEU ${this.escolhaJogador}");
  }

  @override
  _ResultadoState createState() => _ResultadoState();
}

class _ResultadoState extends State<Resultado> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffff61bd86),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset("images/moeda_${widget.escolhaJogador}.png"),
            Padding(
              padding: EdgeInsets.only(top: 0),
              child: GestureDetector(
                child: Image.asset("images/botao_voltar.png"),
                onTap: () => Navigator.pop(context),
              ),
            )
          ],
        ),
      ),
    );

    Container();
  }
}
