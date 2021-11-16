import 'package:flutter/material.dart';

class EntradaCheckbox extends StatefulWidget {
  const EntradaCheckbox({Key? key}) : super(key: key);

  @override
  _EntradaCheckboxState createState() => _EntradaCheckboxState();
}

class _EntradaCheckboxState extends State<EntradaCheckbox> {
  var _checkBrasileira = false;
  var _checkMexicana = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Entrada de Dados"),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            CheckboxListTile(
                title: Text("Comida brasileira"),
                subtitle: Text("algo de bom na comida"),
                //activeColor: Colors.red,
                //selected: true,
                //secondary: Icon(Icons.food_bank),
                value: _checkBrasileira,
                onChanged: (bool? b) {
                  setState(() {
                    _checkBrasileira = b!;
                  });
                  print("Checkbox=${b.toString()}");
                }),
            CheckboxListTile(
                title: Text("Comida Mexicana"),
                subtitle: Text("algo de bom na comida"),
                //activeColor: Colors.red,
                //selected: true,
                //secondary: Icon(Icons.food_bank),
                value: _checkMexicana,
                onChanged: (bool? b) {
                  setState(() {
                    _checkMexicana = b!;
                  });
                  print("Checkbox=${b.toString()}");
                }),
            RaisedButton(
              onPressed: () {
                print(
                    "Comida Brasileira: ${_checkBrasileira.toString()} Comida Mexicana: ${_checkMexicana.toString()}");
              },
              child: Text(
                "Salvar",
                style: TextStyle(fontSize: 20),
              ),
            )

            /*
            Text("Comida brasileira"),
            Checkbox(
                value: _check1,
                onChanged: (bool? b) {
                  setState(() {
                    _check1 = b!;
                  });
                  print("Checkbox=${b.toString()}");
                }
            )*/
          ],
        ),
      ),
    );
  }
}
