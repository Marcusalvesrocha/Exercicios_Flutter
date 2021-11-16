import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController cepController = TextEditingController();
  var _resultado = "";

  _recuperaCep() async {
    String cep = cepController.text;
    String url = "https://viacep.com.br/ws/${cep}/json/";

    http.Response response;

    response = await http.get(url);
    Map<String, dynamic> resposta = json.decode(response.body);

    var chaves = [];

    for (var k in resposta.keys) {
      chaves.add(k.characters);
    }

    //print(resposta["${chaves[0]}"]);
    _limpaResultado();

    for (int i = 0; i < resposta.length; i++) {
      _resultado += ("${chaves[i]}: ${resposta["${chaves[i]}"]} - ");
    }
    setState(() {
      _resultado;
    });
    //_limpaResultado();
    //for

    //print("Status Code: " + response.statusCode.toString());
    //print("Resposta: " + response.body);
  }

  _limpaResultado() => _resultado = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Consumo de serviço web"),
      ),
      body: Container(
        padding: EdgeInsets.all(40),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: "CEP",
              ),
              keyboardType: TextInputType.number,
              controller: cepController,
            ),
            RaisedButton(
              onPressed: _recuperaCep,
              child: Text("Click aqui!"),
            ),
            Text(_resultado),
          ],
        ),
      ),
    );
  }
}
