import 'dart:math';

import 'package:flutter/material.dart';

class Jogo extends StatefulWidget {
  const Jogo({Key? key}) : super(key: key);

  @override
  _JogoState createState() => _JogoState();
}

class _JogoState extends State<Jogo> {
  var _imageApp = AssetImage("images/padrao.png");
  var _mensagem = "Sua escolha:";

  void _opcaoSelecionada(String escolha) {
    var opcoes = ["pedra", "papel", "tesoura"];
    var numero = Random().nextInt(opcoes.length);
    var escolhaApp = opcoes[numero];

    print("opção selecionada do usuario $escolha");
    print("opção selecionada do app $escolhaApp");

    setState(() {
      this._imageApp = AssetImage("images/${opcoes[numero]}.png");
      if (escolha == escolhaApp) {
        this._mensagem = "Empatou";
      } else {
        if ((escolha == "pedra" && escolhaApp == "tesoura") ||
            (escolha == "tesoura" && escolhaApp == "papel") ||
            (escolha == "papel" && escolhaApp == "pedra")) {
          this._mensagem = "Você ganhou :)";
        } else {
          this._mensagem = "Você perdeu :(";
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("JOKEMPO"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(bottom: 16, top: 32),
                child: Text(
                  "Escolha do App:",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              Image(
                image: this._imageApp,
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 32, top: 32),
                child: Text(
                  this._mensagem,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () => _opcaoSelecionada("pedra"),
                      child: Image.asset(
                        "images/pedra.png",
                        height: 105,
                      ),
                    ),
                    GestureDetector(
                      onTap: () => _opcaoSelecionada("papel"),
                      child: Image.asset(
                        "images/papel.png",
                        height: 105,
                      ),
                    ),
                    GestureDetector(
                      onTap: () => _opcaoSelecionada("tesoura"),
                      child: Image.asset(
                        "images/tesoura.png",
                        height: 105,
                      ),
                    ),
                  ])
            ],
          ),
        ],
      ),
    );
  }
}
