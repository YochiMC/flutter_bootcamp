import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'AppBar_menucito.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBarMenucito(),
        body: const Center(child: Text('Mi primera aplicación :D')),
      ),
    );
  }
}
