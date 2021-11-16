import 'package:flutter/material.dart';

class CampoTexto extends StatefulWidget {
  const CampoTexto({Key? key}) : super(key: key);

  @override
  _CampoTextoState createState() => _CampoTextoState();
}

class _CampoTextoState extends State<CampoTexto> {
  TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Entrada de Dados",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(25),
            child: Column(
              children: <Widget>[
                TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(labelText: "Digite um valor"),
                  enabled: true,
                  maxLength: 2,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.blue,
                  ),
                  //obscureText: true,
                  onChanged: (String e) {
                    print("digitado = $e");
                  },
                  onSubmitted: (String e) {
                    print("submit = $e");
                  },
                  controller: _textEditingController,
                )
              ],
            ),
          ),
          RaisedButton(
            onPressed: () {
              print("Salvar o valor ${_textEditingController.text}");
            },
            child: Text(
              "Salvar",
              style: TextStyle(color: Colors.white),
            ),
            color: Colors.blue,
          )
        ],
      ),
    );
  }
}
