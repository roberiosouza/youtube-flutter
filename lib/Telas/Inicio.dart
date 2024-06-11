import 'package:flutter/material.dart';
import 'package:youtube_flutter/model/Video.dart';

import '../API.dart';

class Inicio extends StatefulWidget {
  const Inicio({super.key});

  @override
  State<Inicio> createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  _listarVideos() {
    API api = API();
    return api.pesquisar("");
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Video>>(
        future: _listarVideos(),
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
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Container(
                            height: 200,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(
                                        snapshot.data![index].imagem!))),
                          ),
                          ListTile(
                            title: Text(snapshot.data![index].titulo!),
                            subtitle: Text(snapshot.data![index].canal!),
                          )
                        ],
                      );
                    },
                    separatorBuilder: (context, index) => Divider(
                          height: 2,
                          color: Colors.grey,
                        ),
                    itemCount: snapshot.data!.length);
              } else {
                return Center(
                  child: Text("Nenhum dado a ser exibido!"),
                );
              }
              break;
          }
        });
  }
}
