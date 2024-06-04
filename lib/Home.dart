import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          "images/youtube.png",
          height: 20,
        ),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.videocam)),
          IconButton(onPressed: () {}, icon: Icon(Icons.search)),
          IconButton(onPressed: () {}, icon: Icon(Icons.account_circle))
        ],
      ),
    );
  }
}
