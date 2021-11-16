import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

import 'package:servico_avancado/Post.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var url = "https://jsonplaceholder.typicode.com";

  Future<List<Post>> _recuperaPosts() async {
    http.Response response = await http.get(url + "/posts");
    var dadosJson = json.decode(response.body);
    List<Post> postagens = List.empty(growable: true);

    for (var post in dadosJson) {
      Post p = Post(post['userId'], post['id'], post['title'], post['body']);
      postagens.add(p);
    }
    return postagens;
  }

  _post() async {
    var response = await http.post(url + "/posts",
        headers: {'Content-type': 'application/json; charset=UTF-8'},
        body: json.encode({
          "userId": 11,
          "title": "Adicionado por POST",
          "body": "eveniet architecto"
        }));

    print("Resposta: ${response.statusCode}");
    print("Resposta: ${response.body}");
  }

  _put() async {
    var response = await http.put(url + "/posts/2",
        headers: {'Content-type': 'application/json; charset=UTF-8'},
        body: json.encode(
            {"userId": 1111, "title": "Alterado por PUT", "body": "Alterado"}));

    print("Resposta: ${response.statusCode}");
    print("Resposta: ${response.body}");
  }

  _patch() async {
    var response = await http.patch(url + "/posts/2",
        headers: {'Content-type': 'application/json; charset=UTF-8'},
        body: json.encode({"title": "Alterado por PATCH"}));

    print("Resposta: ${response.statusCode}");
    print("Resposta: ${response.body}");
  }

  _delete() async {
    var response = await http.delete(url + "/posts/2");

    print("Resposta: ${response.statusCode}");
    print("Resposta: ${response.body}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Consumo de serviço avançado"),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              children: [
                RaisedButton(
                  onPressed: _post,
                  child: Text("Salvar"),
                ),
                TextButton(
                  style: ButtonStyle(
                      foregroundColor:
                          MaterialStateProperty.all(Colors.black54)),
                  onPressed: _put,
                  child: Text("PUT"),
                ),
                TextButton(
                  style: ButtonStyle(
                      foregroundColor:
                          MaterialStateProperty.all(Colors.black54)),
                  onPressed: _patch,
                  child: Text("PATCH"),
                ),
                RaisedButton(
                  onPressed: _delete,
                  child: Text("Remover"),
                )
              ],
            ),
            Expanded(
                child: FutureBuilder<List<Post>>(
                    future: _recuperaPosts(),
                    builder: (context, snapshot) {
                      switch (snapshot.connectionState) {
                        case ConnectionState.none:
                        case ConnectionState.waiting:
                          return Center(
                            child: CircularProgressIndicator(),
                          );

                          break;
                        case ConnectionState.active:
                        case ConnectionState.done:
                          print(
                              "snapshot.data ${snapshot.data?.elementAt(0).title.toString()}");
                          if (snapshot.hasError) {
                            print("Erro ao carregar as postagens...");
                          } else {
                            print("Pastagens carregadas");
                            return ListView.builder(
                                itemCount: snapshot.data?.length,
                                itemBuilder: (context, index) {
                                  return ListTile(
                                    title: Text(
                                        "ID: ${snapshot.data?.elementAt(index).id.toString()} - ${snapshot.data?.elementAt(index).title.toString()}"),
                                    subtitle: Text(
                                        "${snapshot.data?.elementAt(index).body.toString()}"),
                                  );
                                });
                          }

                          break;
                      }
                      return Center(
                        child: Text("resultado"),
                      );
                    }))
          ],
        ),
      ),
    );
  }
}


/*
FutureBuilder<Map>(
        
           //const CircularProgressIndicator();
        }
*/