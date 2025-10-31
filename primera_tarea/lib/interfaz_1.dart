import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'AppBar_menucito.dart';

class ColumnasInterface extends StatefulWidget {
  const ColumnasInterface({super.key});

  @override
  State<ColumnasInterface> createState() => _ColumnasInterfaceState();
}

class _ColumnasInterfaceState extends State<ColumnasInterface> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarMenucito(),
      body: Center(
        child: Padding(
          padding: EdgeInsets.only(top: 15.0),
          child: Column(
            spacing: 35,
            children: [
              Container(width: 900, height: 70, color: Colors.grey),
              Container(
                width: 900,
                height: 70,
                color: Colors.green,
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(left: 10),
                child: Container(width: 120, height: 55, color: Colors.yellow),
              ),
              Container(
                width: 900,
                height: 70,
                color: Colors.yellow,
                alignment: Alignment.center,
                child: Container(width: 120, height: 55, color: Colors.red),
              ),
              Container(
                width: 900,
                height: 70,
                color: Colors.red,
                alignment: Alignment.centerRight,
                padding: EdgeInsets.only(right: 10),
                child: Container(width: 120, height: 55, color: Colors.green),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
