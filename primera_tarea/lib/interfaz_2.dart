import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'AppBar_menucito.dart';

class FilasInterface extends StatefulWidget {
  const FilasInterface({super.key});

  @override
  State<FilasInterface> createState() => _FilasInterfaceState();
}

class _FilasInterfaceState extends State<FilasInterface> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarMenucito(),
      body: Padding(
        padding: EdgeInsets.only(top: 10),
        child: Row(
          children: [
            SizedBox(
              width: 300,
              child: FilledButton(
                style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(Colors.yellow),
                ),
                onPressed:
                    () => showDialog<String>(
                      context: context,
                      builder:
                          (BuildContext context) => AlertDialog(
                            title: Text('Esto es una alerta'),
                            content: Text('Fuera Lourdes'),
                            actions: <Widget>[
                              FilledButton(
                                onPressed: () => Navigator.pop(context, 'Ok'),
                                child: Text('Ok'),
                              ),
                            ],
                          ),
                    ),
                child: Text('AlertDialog'),
              ),
            ),
            Expanded(
              child: FilledButton(
                style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(Colors.yellow),
                ),
                onPressed: null,
                child: Text('Expanded'),
              ),
            ),
            Flexible(
              child: FilledButton(
                style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(Colors.yellow),
                ),
                onPressed: null,
                child: Text('Flexible'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
