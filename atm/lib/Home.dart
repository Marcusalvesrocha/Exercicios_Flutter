import 'package:atm/Cliente.dart';
import 'package:atm/Contato.dart';
import 'package:atm/Empresa.dart';
import 'package:atm/Servico.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  void _abrirEmpresa() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => Empresa()));
  }

  void _abrirServico() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => Servico()));
  }

  void _abrirCliente() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => Cliente()));
  }

  void _abrirContato() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => Contato()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text("ATM Consultoria"),
          backgroundColor: Colors.green,
        ),
        body: Container(
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Image.asset("imagens/logo.png"),
                Padding(
                  padding: EdgeInsets.only(top: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      GestureDetector(
                        child: Image.asset("imagens/menu_empresa.png"),
                        onTap: _abrirEmpresa,
                      ),
                      GestureDetector(
                        child: Image.asset("imagens/menu_servico.png"),
                        onTap: _abrirServico,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      GestureDetector(
                        child: Image.asset("imagens/menu_cliente.png"),
                        onTap: _abrirCliente,
                      ),
                      GestureDetector(
                        child: Image.asset("imagens/menu_contato.png"),
                        onTap: _abrirContato,
                      ),
                    ],
                  ),
                ),
              ],
            )));
  }
}
