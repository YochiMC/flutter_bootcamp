import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'drawer_element.dart';
import '../home.dart';
import '../views/user/aranias.dart';
import '../views/admin/crud_aranias.dart';
import '../views/admin/add_insect.dart';
import '../../assets/theme.dart';

class MenuLateral extends StatefulWidget {
  const MenuLateral({super.key});

  @override
  State<MenuLateral> createState() => _MenuLateralState();
}

class _MenuLateralState extends State<MenuLateral> {
  final user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return NavigationDrawer(
      tilePadding: EdgeInsets.all(25),
      children: drawersSelection(user)
    );
  }
}

List<Widget> drawersSelection(User? user) {
  if (user != null) {
    return [
      DrawerElement(icon: Icon(Icons.home), title: 'Home', page: Home()),
      DrawerElement(icon: Icon(Icons.search), title: 'Arañas (Admin)', page: Dashboard()),
      DrawerElement(icon: Icon(Icons.add), title: 'Añadir araña', page: AddInsect(),),
      DrawerElement(
        icon: Icon(Icons.question_answer),
        title: 'Acerca de nosotros',
        page: Home(),
      ),
    ];
  } else {
    return [
      DrawerElement(icon: Icon(Icons.home), title: 'Home', page: Home()),
      DrawerElement(icon: Icon(Icons.search), title: 'Arañas', page: Aranias()),
      DrawerElement(
        icon: Icon(Icons.question_answer),
        title: 'Acerca de nosotros',
        page: Home(),
      ),
    ];
  }
}
