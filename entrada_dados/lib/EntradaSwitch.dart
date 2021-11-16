import 'package:flutter/material.dart';

class EntradaSwitch extends StatefulWidget {
  const EntradaSwitch({Key? key}) : super(key: key);

  @override
  _EntradaSwitchState createState() => _EntradaSwitchState();
}

class _EntradaSwitchState extends State<EntradaSwitch> {
  var _notificacaoes = false;
  var _configuracoes = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Entrada de Dados: Switch"),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            SwitchListTile(
                title: Text("Receber notificações?"),
                value: _notificacaoes,
                onChanged: (bool valor) {
                  setState(() {
                    _notificacaoes = valor;
                  });
                }),
            RaisedButton(
              onPressed: () {
                print("Resultado $_notificacaoes");
              },
              child: Text(
                "Salvar",
                style: TextStyle(fontSize: 20),
              ),
            )
            /*
            Switch(
                value: _notificacaoes,
                onChanged: (bool valor) {
                  setState(() {
                    _notificacaoes = valor;
                  });
                }),*/
          ],
        ),
      ),
    );
  }
}
