import 'package:flutter/material.dart';
import 'package:youtube_flutter/CustomSearchDelegate.dart';
import 'package:youtube_flutter/Telas/Biblioteca.dart';
import 'package:youtube_flutter/Telas/EmAlta.dart';
import 'package:youtube_flutter/Telas/Inscricoes.dart';

import 'Telas/Inicio.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _indiceAtual = 0;
  String _resultado = "";

  late Inicio inicio;
  late List<Widget> telas;

  @override
  void initState() {
    super.initState();
    _carregaTelas();
  }

  _carregaTelas() {
    telas = [
      Inicio(pesquisa: _resultado),
      EmAlta(),
      Inscricoes(),
      Biblioteca()
    ];
  }

  @override
  Widget build(BuildContext context) {
    _carregaTelas();
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          "images/youtube.png",
          height: 20,
        ),
        actions: [
          IconButton(
              onPressed: () async {
                String? res = await showSearch(
                    context: context, delegate: CustomSearchDelegate());
                setState(() {
                  _resultado = res!;
                });
              },
              icon: Icon(Icons.search)),
          /* IconButton(onPressed: () {}, icon: Icon(Icons.videocam)),
          IconButton(onPressed: () {}, icon: Icon(Icons.search)),
          IconButton(onPressed: () {}, icon: Icon(Icons.account_circle)) */
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: telas[_indiceAtual],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _indiceAtual,
        onTap: (idx) {
          setState(() {
            _indiceAtual = idx;
          });
        },
        fixedColor: Colors.red,
        items: [
          BottomNavigationBarItem(label: "Home", icon: Icon(Icons.home)),
          BottomNavigationBarItem(label: "Em Alta", icon: Icon(Icons.whatshot)),
          BottomNavigationBarItem(
              label: "Inscrições", icon: Icon(Icons.subscriptions)),
          BottomNavigationBarItem(label: "Biblioteca", icon: Icon(Icons.folder))
        ],
      ),
    );
  }
}
