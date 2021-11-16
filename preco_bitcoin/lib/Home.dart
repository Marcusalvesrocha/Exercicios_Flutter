import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var _api = "https://blockchain.info/ticker";
  var _preco = "R\$0.00";
  var _moeda = "BRL";
  var _opcao = "buy";
  _atualizar() async {
    http.Response response;

    response = await http.get(_api);

    print(response.body);

    Map<String, dynamic> lista = json.decode(response.body);

    for (var k in lista.entries) {
      if (k.key == _moeda) {
        setState(() {
          _preco = "R\$${k.value[_opcao]}";
        });

        print(k.value[_opcao]);
        print("Key = ${k.key} - Value = ${k.value}");
        //for (var b in brl.entries) {
        //  print("Key = ${b.key} - Value = ${b.value}");
        //}
      }
    }

    //print(lista.values);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset("images/bitcoin.png"),
              Padding(
                  padding: EdgeInsets.only(top: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        _preco,
                        style: TextStyle(
                            color: Colors.black87,
                            fontWeight: FontWeight.bold,
                            fontSize: 40),
                      ),
                    ],
                  )),
              Padding(
                padding: EdgeInsets.only(top: 15, left: 60, right: 60),
                child: RaisedButton(
                  onPressed: _atualizar,
                  color: Colors.orange,
                  child: Text(
                    "Atualizar",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              )
            ],
          )),
    );
  }
}
