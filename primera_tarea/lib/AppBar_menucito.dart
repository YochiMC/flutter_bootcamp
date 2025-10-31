import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'interfaz_1.dart';
import 'interfaz_2.dart';

class AppBarMenucito extends StatefulWidget implements PreferredSizeWidget {
  const AppBarMenucito({super.key});

  @override
  State<AppBarMenucito> createState() => _AppBarMenucitoState();

  @override
  Size get preferredSize {
    return const Size.fromHeight(kToolbarHeight + 45.0);
  }
}

class _AppBarMenucitoState extends State<AppBarMenucito> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.blueGrey,
      title: Center(child: Text('Mi primer aplicación')),
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(45),
        child: Container(
          width: 200,
          height: 70,
          color: Colors.blueGrey,
          alignment: Alignment.center,
          child: Center(
            child: Row(
              spacing: 60,
              children: [
                Column(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ColumnasInterface(),
                          ),
                        );
                      },
                      icon: Icon(Icons.view_column_sharp),
                    ),
                    Text('Columnas'),
                  ],
                ),
                Column(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => FilasInterface(),
                          ),
                        );
                      },
                      icon: Icon(Icons.table_rows),
                    ),
                    Text('Filas'),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
