import 'package:flutter/material.dart';

import '../API.dart';

class Inicio extends StatefulWidget {
  const Inicio({super.key});

  @override
  State<Inicio> createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  @override
  Widget build(BuildContext context) {
    API api = API();
    api.pesquisar("");

    return Container(
      child: Center(
        child: Text(
          "Home",
          style: TextStyle(
              fontSize: 15, color: Colors.red, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
