import 'package:flutter/material.dart';

import 'layouts/basic_layout.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return BasicLayout(
      title: 'Home',
      child: Scaffold(body: Center(child: Text('Holaaa saluditos desde el home'))),
    );
  }
}
