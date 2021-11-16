import 'dart:math';

import 'package:caracoroa/Resultado.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  void _jogar() {
    var _opcoes = ["cara", "cforoa"];
    var _escolha = Random().nextInt(_opcoes.length);
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => Resultado(
                  _opcoes[_escolha],
                )));
    print("Escolha ${_opcoes[_escolha]}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffff61bd86),
      body: Container(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset("images/logo.png"),
            Padding(
              padding: EdgeInsets.only(top: 40),
              child: GestureDetector(
                onTap: _jogar,
                child: Image.asset("images/botao_jogar.png"),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
