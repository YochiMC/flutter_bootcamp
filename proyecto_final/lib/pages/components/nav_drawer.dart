import 'package:flutter/material.dart';
import 'drawer_element.dart';
import '../../assets/theme.dart';
import '../home.dart';
import '../views/user/aranias.dart';

class MenuLateral extends StatefulWidget {
  const MenuLateral({super.key});

  @override
  State<MenuLateral> createState() => _MenuLateralState();
}

class _MenuLateralState extends State<MenuLateral> {
  @override
  Widget build(BuildContext context) {
    return NavigationDrawer(
      tilePadding: EdgeInsets.all(25),
      children: [
        DrawerElement(icon: Icon(Icons.home), title: 'Home', page: Home()),
        DrawerElement(icon: Icon(Icons.search), title: 'Arañas', page: Aranias()),
        DrawerElement(
          icon: Icon(Icons.question_answer),
          title: 'Acerca de nosotros',
          page: Home(),
        ),
      ],
    );
  }
}


