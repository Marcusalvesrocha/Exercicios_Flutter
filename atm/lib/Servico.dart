import 'package:flutter/material.dart';

class Servico extends StatefulWidget {
  const Servico({Key? key}) : super(key: key);

  @override
  _ServicoState createState() => _ServicoState();
}

class _ServicoState extends State<Servico> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Serviço"),
        backgroundColor: Colors.blue,
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
                Image.asset("imagens/detalhe_servico.png"),
                Text(
                  "Serviços",
                  style: TextStyle(fontSize: 25),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: Text("Consultoria"),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: Text("Cálculo de preços"),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: Text("Acompanhamento de projeto"),
            ),
          ],
        ),
      )),
    );
  }
}
