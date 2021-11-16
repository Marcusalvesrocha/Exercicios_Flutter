import 'package:flutter/material.dart';

class Contato extends StatefulWidget {
  const Contato({Key? key}) : super(key: key);

  @override
  _ContatoState createState() => _ContatoState();
}

class _ContatoState extends State<Contato> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contato"),
        backgroundColor: Colors.green,
      ),
      body: Container(
          child: SingleChildScrollView(
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset("imagens/detalhe_contato.png"),
                Text(
                  "Contatos",
                  style: TextStyle(color: Colors.greenAccent, fontSize: 25),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 30, bottom: 15),
              child: Text("E-mail: atmconsultoria@atm.com.br"),
            ),
            Text("Telefone: (75) 3281-4476"),
            Text("Celular: (75) 9 9888-2536"),
          ],
        ),
      )),
    );
  }
}
