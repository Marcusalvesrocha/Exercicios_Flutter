import 'package:flutter/material.dart';

class EntradaSlider extends StatefulWidget {
  const EntradaSlider({Key? key}) : super(key: key);

  @override
  _EntradaSliderState createState() => _EntradaSliderState();
}

class _EntradaSliderState extends State<EntradaSlider> {
  var _valor = 5.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Entrada de Dados: Slider"),
      ),
      body: Container(
        padding: EdgeInsets.all(60),
        child: Column(
          children: <Widget>[
            Slider(
                value: _valor,
                min: 0,
                max: 10,
                label: "$_valor",
                divisions: 10,
                activeColor: Colors.red,
                inactiveColor: Colors.black12,
                onChanged: (double novoValor) {
                  setState(() {
                    _valor = novoValor;
                  });
                }),
            RaisedButton(
              onPressed: () {
                print("Valor $_valor ");
              },
              child: Text(
                "Salvar",
                style: TextStyle(fontSize: 20),
              ),
            )
          ],
        ),
      ),
    );
  }
}
