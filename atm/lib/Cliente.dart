import 'package:flutter/material.dart';

class Cliente extends StatefulWidget {
  const Cliente({Key? key}) : super(key: key);

  @override
  _ClienteState createState() => _ClienteState();
}

class _ClienteState extends State<Cliente> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cliente"),
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
                Image.asset("imagens/detalhe_cliente.png"),
                Text(
                  "Clientes",
                  style: TextStyle(fontSize: 25),
                )
              ],
            ),
            Padding(
                padding: EdgeInsets.only(top: 20),
                child: Column(
                  children: [
                    Image.asset("imagens/cliente1.png"),
                    Text("Empresa de Software")
                  ],
                )),
            Padding(
                padding: EdgeInsets.only(top: 20),
                child: Column(
                  children: [
                    Image.asset("imagens/cliente2.png"),
                    Text("Empresa de Auditoria")
                  ],
                )),
          ],
        ),
      )),
    );
  }
}
