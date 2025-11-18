import 'package:flutter/material.dart';
import '../../assets/theme.dart';

class MenuLateral extends StatefulWidget implements PreferredSizeWidget {
  const MenuLateral({super.key});

  @override
  State<MenuLateral> createState() => _MenuLateralState();

  @override
  Size get preferredSize {
    return const Size.fromHeight(kToolbarHeight + 0);
  }
}

class _MenuLateralState extends State<MenuLateral>{
  @override
  Widget build(BuildContext context){
    return NavigationDrawer(
      tilePadding: EdgeInsets.all(25),
      children: [
      ListTile(
        leading: Icon(Icons.home),
        title: Text('Principal'),
        onTap: (){
          print('principal');
        },
      ),
      ListTile(
        leading: Icon(Icons.question_answer),
        title: Text('Acerca de nosotros'),
        onTap: (){
          print('acercade');
        }
      ),
    ]);
  }
}
