import 'package:flutter/material.dart';
import 'package:youtube/Api.dart';
import 'package:youtube/model/Video.dart';

class Inicio extends StatefulWidget {
  String? query;

  Inicio(this.query);

  @override
  _InicioState createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  _listarVideos(String query) {
    Api api = Api();

    return api.pesquisar(query);
  }

  @override
  void initState() {
    super.initState();
    print("Chamado 1 - initstate");
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("Chamado 2.1 - didChangeDependencies");
  }

  @override
  void didUpdateWidget(covariant Inicio oldWidget) {
    super.didUpdateWidget(oldWidget);
    print("Chamado 2.2 - didUpdateWidget");
  }

  @override
  void dispose() {
    super.dispose();
    print("Chamado 4 - dispose");
  }

  @override
  Widget build(BuildContext context) {
    print("Chamado 3 - build");
    return FutureBuilder<List>(
      future: _listarVideos(widget.query!),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
          case ConnectionState.active:
          case ConnectionState.waiting:
            return Center(
              child: CircularProgressIndicator(),
            );
            break;
          case ConnectionState.done:
            if (snapshot.hasData) {
              return ListView.separated(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  Video video = snapshot.data![index];

                  //print("$index - ${video.titulo}");

                  return Column(
                    children: [
                      Container(
                        height: 200,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(video.imagem!),
                                fit: BoxFit.fill)),
                      ),
                      ListTile(
                        title: Text(video.titulo!),
                        subtitle: Text(video.descricao!),
                      )
                    ],
                  );
                },
                separatorBuilder: (context, index) => Divider(
                  height: 2,
                  color: Colors.grey,
                ),
              );
            } else {
              return Center(
                child: Text("Não encontrou dados"),
              );
            }
            break;
        }
      },
    );
  }
}
