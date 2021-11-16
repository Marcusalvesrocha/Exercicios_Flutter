import 'package:flutter/material.dart';

class CustonSearchDelegate extends SearchDelegate<String> {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            print(query);
            query = "";
          },
          icon: Icon(Icons.clear)),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, "");
        },
        icon: Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    print("Resultado: pesquisa realizada");
    close(context, query);
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> lista;

    if (query.isNotEmpty) {
      lista = [
        "Flutterando",
        "Android",
        "Flutter Navegação",
        "IOS",
        "Jogos",
      ]
          .where((element) =>
              element.toLowerCase().startsWith(query.toLowerCase()))
          .toList();

      return ListView.builder(
          itemCount: lista.length,
          itemBuilder: (context, index) {
            return ListTile(
              onTap: () => close(context, lista[index]),
              title: Text(lista[index]),
            );
          });
    }

    print("Resultado: digitado " + query);
    return Container();
  }
}
