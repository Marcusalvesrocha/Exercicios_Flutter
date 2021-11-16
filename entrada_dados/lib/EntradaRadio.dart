import 'package:flutter/material.dart';

class EntradaRadio extends StatefulWidget {
  const EntradaRadio({Key? key}) : super(key: key);

  @override
  _EntradaRadioState createState() => _EntradaRadioState();
}

class _EntradaRadioState extends State<EntradaRadio> {
  var _escolhaSexo = "f";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Entrada de Dados: RadioButtom"),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            RadioListTile(
                title: Text("Masculino"),
                value: "m",
                groupValue: _escolhaSexo,
                onChanged: (var value) {
                  print("Sexo escolhido= $value");
                  setState(() {
                    _escolhaSexo = value.toString();
                  });
                }),
            RadioListTile(
                title: Text("Feminino"),
                value: "f",
                groupValue: _escolhaSexo,
                onChanged: (var value) {
                  print("Sexo escolhido= $value");
                  setState(() {
                    _escolhaSexo = value.toString();
                  });
                }),
            RaisedButton(
              onPressed: () {
                print("Resultado $_escolhaSexo");
              },
              child: Text(
                "Salvar",
                style: TextStyle(fontSize: 20),
              ),
            )
            /*
            Text("Masculino"),
            Radio(
                value: "m",
                groupValue: _escolhaSexo,
                onChanged: (var value) {
                  print("Sexo escolhido= $value");
                  setState(() {
                    _escolhaSexo = value.toString();
                  });
                }),
            Text("Feminino"),
            Radio(
                value: "f",
                groupValue: _escolhaSexo,
                onChanged: (var value) {
                  print("Sexo escolhido= $value");
                  setState(() {
                    _escolhaSexo = value.toString();
                  });
                })*/
          ],
        ),
      ),
    );
  }
}
