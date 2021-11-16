import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final items = List<String>.generate(10, (i) => "Item $i");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lista"),
      ),
      body: Container(
          padding: EdgeInsets.all(20),
          child: ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              return ListTile(
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          actions: [
                            FlatButton(
                                onPressed: () {
                                  print("selecionado sim $index");
                                  Navigator.pop(context);
                                },
                                child: Text("Sim")),
                            FlatButton(
                                onPressed: () {
                                  print("selecionado nao $index");
                                  Navigator.pop(context);
                                },
                                child: Text("Não")),
                          ],
                          backgroundColor: Colors.purple,
                          title: Text(items[index]),
                          titlePadding: EdgeInsets.all(50),
                          titleTextStyle:
                              TextStyle(fontSize: 20, color: Colors.orange),
                          content: Text(items[index]),
                          contentPadding: EdgeInsets.all(50),
                        );
                      });
                },
                //onLongPress: () {
                //  print("Clique longo");
                //},
                title: Text(items[index]),
                subtitle: Text("Produtos para venda"),
              );
            },
          )),
    );
  }
}
