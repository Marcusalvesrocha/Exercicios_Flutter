import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController _valAlcool = TextEditingController();
  TextEditingController _valGasolina = TextEditingController();
  String _resultado = "";

  void _calcular() {
    var precoAlcool = double.tryParse(_valAlcool.text);
    var precoGasolina = double.tryParse(_valGasolina.text);

    setState(() {
      if (precoAlcool == null || precoGasolina == null) {
        _resultado = "Números inválidos ou com virgulas";
      } else {
        if (precoAlcool / precoGasolina >= 0.7) {
          _resultado = "Melhor abastecer com Gasolina";
        } else {
          _resultado = "Melhor abastecer com Alcool";
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Álcool ou Gasolina"),
          backgroundColor: Colors.blue,
        ),
        body: Container(
            child: SingleChildScrollView(
          padding: EdgeInsets.all(25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(bottom: 25),
                child: Image.asset("images/logo.png"),
              ),
              Padding(
                  padding: EdgeInsets.only(bottom: 25),
                  child: Text(
                    "Saiba qual a melhor opção para abastecimento do seu carro",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  )),
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: TextFormField(
                  controller: _valAlcool,
                  decoration: InputDecoration(labelText: "Preço Álcool"),
                  keyboardType: TextInputType.number,
                  style: TextStyle(fontSize: 22, color: Colors.blue),
                  onTap: () => print("Preço do alcool"),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 25),
                child: TextFormField(
                  controller: _valGasolina,
                  decoration: InputDecoration(labelText: "Preço Gasolina"),
                  keyboardType: TextInputType.number,
                  style: TextStyle(fontSize: 22, color: Colors.blue),
                  onTap: _calcular,
                ),
              ),
              Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: RaisedButton(
                    onPressed: _calcular,
                    child: Text(
                      "Calcular",
                      style: TextStyle(fontSize: 20),
                    ),
                    color: Colors.blue,
                    textColor: Colors.white,
                  )),
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: Text(_resultado,
                    style:
                        TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
              )
            ],
          ),
        ))

        /**/
        );
  }
}
