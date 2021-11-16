import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String _texto = "Nada Salvo";
  TextEditingController _valorController = TextEditingController();
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<void> _salvar() async {
    String valorDigitado = _valorController.text;

    final SharedPreferences prefs = await _prefs;
    await prefs.setString("nome", valorDigitado);
    print("Operação SALVA: $valorDigitado");
  }

  Future<void> _recuperar() async {
    final SharedPreferences prefs = await _prefs;
    setState(() {
      _texto = prefs.getString("nome") ?? "sem valor";
    });
    print("Operação RECUPERAR: $_texto");
  }

  _remover() async {
    final SharedPreferences prefs = await _prefs;
    prefs.remove("nome");
    print("Operação REMOVER");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mnipulação de dados"),
      ),
      body: Container(
        padding: EdgeInsets.all(32),
        child: Column(
          children: [
            Text(
              _texto,
              style: TextStyle(fontSize: 20),
            ),
            TextField(
              controller: _valorController,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: "Digite algo",
              ),
            ),
            Row(
              children: [
                RaisedButton(
                    color: Colors.blue,
                    textColor: Colors.white,
                    padding: EdgeInsets.all(15),
                    child: Text("Salvar"),
                    onPressed: _salvar),
                RaisedButton(
                    color: Colors.blue,
                    textColor: Colors.white,
                    padding: EdgeInsets.all(15),
                    child: Text("Ler"),
                    onPressed: _recuperar),
                RaisedButton(
                    color: Colors.blue,
                    textColor: Colors.white,
                    padding: EdgeInsets.all(15),
                    child: Text("Remover"),
                    onPressed: _remover),
              ],
            )
          ],
        ),
      ),
    );
  }
}
